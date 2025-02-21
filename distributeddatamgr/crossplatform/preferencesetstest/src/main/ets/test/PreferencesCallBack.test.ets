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
const NAME1 = "getPreferencesTest";
const KEY_TEST_INT_ELEMENT = "key_test_int";
const KEY_TEST_LONG_ELEMENT = "key_test_long";
const KEY_TEST_FLOAT_ELEMENT = "key_test_float";
const KEY_TEST_BOOLEAN_ELEMENT = "key_test_boolean";
const KEY_TEST_STRING_ELEMENT = "key_test_string";
const KEY_TEST_NUMBER_ARRAY_ELEMENT = "key_test_number_array";
const KEY_TEST_STRING_ARRAY_ELEMENT = "key_test_string_array";
const KEY_TEST_BOOL_ARRAY_ELEMENT = "key_test_bool_array";
let mPreferences: dataPreferences.Preferences;
const TAG = "[PREFERENCES_CALLBACK_JSUNIT_TEST]";
let context: common.UIAbilityContext;

export default function preferencesCallBackTest() {
  describe("preferencesCallBackTest", () => {
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
     * @tc.number : SUB_DistributedData_CrossPlatform_SDK_Preferences_GetPreferencesJSAPITest_1100
     * @tc.name   : testPreferencesGetPreferences001
     * @tc.desc   : GetPreferences callback interface test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testPreferencesGetPreferences001", 0, async (done: Function) => {
      dataPreferences.getPreferences(context, NAME1, async (err, preferences) => {
        if (err) {
          console.info(TAG + "Get preferences err: " + err);
          expect(!err).assertTrue();
        } else {
          console.info(TAG + "Get preferences success" + preferences);
          await preferences.put(KEY_TEST_STRING_ELEMENT, "test");
          preferences.get(KEY_TEST_STRING_ELEMENT, "defaultvalue", (err, ret) => {
            expect("test").assertEqual(ret);
          });
          await dataPreferences.deletePreferences(context, NAME1);
          done();
        }
      });
    });

    /**
     * @tc.number : SUB_DistributedData_CrossPlatform_SDK_Preferences_GetPreferencesJSAPITest_0700
     * @tc.name   : testPreferencesGetPreferences002
     * @tc.desc   : GetPreferences callback interface test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testPreferencesGetPreferences002", 0, async (done: Function) => {
      try {
        dataPreferences.getPreferences(context, null, (err, preferences) => {
          expect(!err).assertFail();
          done();
        });
      } catch (err) {
        console.info("testPreferencesGetPreferences002 fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
        done();
      }
    });

    /**
     * @tc.number : SUB_DistributedData_CrossPlatform_SDK_Preferences_GetPreferencesJSAPITest_0800
     * @tc.name   : testPreferencesGetPreferences003
     * @tc.desc   : GetPreferences callback interface test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testPreferencesGetPreferences003", 0, async (done: Function) => {
      dataPreferences.getPreferences(context, {
        name: NAME1
      }, async (err, preferences) => {
        if (err) {
          console.info(TAG + "Get preferences err: " + err);
          expect(!err).assertTrue();
        } else { 
          console.info(TAG + "Get preferences success" + preferences);
          await preferences.put(KEY_TEST_STRING_ELEMENT, "test");
          preferences.get(KEY_TEST_STRING_ELEMENT, "defaultvalue", (err, ret) => {
            expect("test").assertEqual(ret);
          });
          await dataPreferences.deletePreferences(context, NAME1);
          done();
        }
      });
    });

    /**
     * @tc.number : SUB_DistributedData_CrossPlatform_SDK_Preferences_GetPreferencesJSAPITest_0900
     * @tc.name   : testPreferencesGetPreferences004
     * @tc.desc   : GetPreferences callback interface test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testPreferencesGetPreferences004", 0, async (done: Function) => {
      try {
        dataPreferences.getPreferences(context, {
          name: null
        }, (err, preferences) => {
          expect(!err).assertFail();
          done();
        });
      } catch (err) {
        console.info("testPreferencesGetPreferences004 fail: " + err.message + "code: " + err.code);
        expect("401").assertEqual(err.code);
        done();
      }
    });

    /**
     * @tc.number : SUB_DistributedData_CrossPlatform_SDK_Preferences_DeleteJSAPITest_0400
     * @tc.name   : testPreferencesDeletePreferences000
     * @tc.desc   : DeletePreferences callback interface test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testPreferencesDeletePreferences000", 0, async (done: Function) => {
      dataPreferences.getPreferences(context, NAME1, (err, preferences) => {
        if (err) {
          console.info(TAG + "Get preferences err: " + err);
          expect(!err).assertTrue();
        } else {
          console.info(TAG + "Get preferences success");
          expect(preferences !== null).assertTrue();
          dataPreferences.deletePreferences(context, NAME1, (err) => {
            console.info(TAG + "Delete preferences success");
            expect(!err).assertTrue();
            done();
          });
        }
      });
    });

    /**
     * @tc.number : SUB_DistributedData_CrossPlatform_SDK_Preferences_DeleteJSAPITest_0500
     * @tc.name   : testPreferencesDeletePreferences001
     * @tc.desc   : DeletePreferences callback interface test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testPreferencesDeletePreferences001", 0, async (done: Function) => {
      dataPreferences.getPreferences(context, NAME1, (err, preferences) => {
        if (err) {
          console.info(TAG + "Get preferences err: " + err);
          expect(!err).assertFail();
        } else {
          console.info(TAG + "Get preferences success");
          expect(preferences !== null).assertTrue();
          try {
            dataPreferences.deletePreferences(context, null, (err) => {
              expect(!err).assertFail();
              done();
            });
            expect(!err).assertFail();
            done();
          } catch (err) {
            console.info("testPreferencesDeletePreferences001 fail: " + err.message + "code: " + err.code);
            expect('401').assertEqual(err.code);
            done();
          }
        }
      });
    });

    /**
     * @tc.number : SUB_DistributedData_CrossPlatform_SDK_Preferences_DeleteJSAPITest_1600
     * @tc.name   : testPreferencesDeletePreferences003
     * @tc.desc   : DeletePreferences callback interface test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testPreferencesDeletePreferences003", 0, async (done: Function) => {
      dataPreferences.getPreferences(context, NAME1, (err, preferences) => {
        if (err) {
          console.info(TAG + "Get preferences err: " + err);
          expect(!err).assertTrue();
          done();
        } else {
          console.info(TAG + "Get preferences success");
          expect(preferences !== null).assertTrue();
          try {
            preferences.put(KEY_TEST_STRING_ELEMENT, "test", (err) => {
              if (err) {
                console.info(TAG + "Put preferences err: " + err);
                return;
              }
              console.info(TAG + "Put preferences success");
              preferences.get(KEY_TEST_STRING_ELEMENT, "defaultvalue", (err, ret) => {
                expect("test").assertEqual(ret);
                dataPreferences.deletePreferences(context, "getPreferencesTest1", (err) => {
                  preferences.get(KEY_TEST_STRING_ELEMENT, "defaultvalue", (err, pre) => {
                    expect("test").assertEqual(pre);
                    done();
                  });
                });
              });
            });

            expect(preferences !== null).assertTrue();
            done();
          } catch (err) {
            console.info("testPreferencesDeletePreferences003 fail: " + err.message + "code: " + err.code);
            expect(!err).assertTrue();
            done();
          }
        }
      });
    });

    /**
     * @tc.number : SUB_DistributedData_CrossPlatform_SDK_Preferences_DeleteJSAPITest_1300
     * @tc.name   : testPreferencesDeletePreferences004
     * @tc.desc   : DeletePreferences callback interface test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testPreferencesDeletePreferences004", 0, async (done: Function) => {
      dataPreferences.getPreferences(context, {
        name: NAME1
      }, (err, preferences) => {
        if (err) {
          console.info(TAG + "Get preferences err: " + err);
          expect(!err).assertTrue();
        } else {
          console.info(TAG + "Get preferences success");
          expect(preferences !== null).assertTrue();
          dataPreferences.deletePreferences(context, {
            name: NAME1
          }, (err) => {
            console.info(TAG + "Delete preferences success");
            expect(!err).assertTrue();
            done();
          });
        }
      });
    });

    /**
     * @tc.number : SUB_DistributedData_CrossPlatform_SDK_Preferences_DeleteJSAPITest_1400
     * @tc.name   : testPreferencesDeletePreferences005
     * @tc.desc   : DeletePreferences callback interface test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testPreferencesDeletePreferences005", 0, async (done: Function) => {
      dataPreferences.getPreferences(context, {
        name: NAME1
      }, (err, preferences) => {
        if (err) {
          console.info(TAG + "Get preferences err: " + err);
          expect(!err).assertTrue();
        } else {
          console.info(TAG + "Get preferences success");
          expect(preferences !== null).assertTrue();
          try {
            dataPreferences.deletePreferences(context, {
              name: null
            }, (err) => {
              expect(!err).assertFail();
              done();
            });
            expect(!err).assertFail();
            done();
          } catch (err) {
            console.info("testPreferencesDeletePreferences005 fail: " + err.message + "code: " + err.code);
            expect('401').assertEqual(err.code);
            done();
          }
        }
      });
    });

    /**
     * @tc.number : SUB_DistributedData_CrossPlatform_SDK_Preferences_DeleteJSAPITest_1200
     * @tc.name   : testPreferencesDeletePreferences006
     * @tc.desc   : DeletePreferences callback interface test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testPreferencesDeletePreferences006", 0, async (done: Function) => {
      dataPreferences.getPreferences(context, {
        name: NAME1
      }, (err, preferences) => {
        if (err) {
          console.info(TAG + "Get preferences err: " + err);
          expect(!err).assertTrue();
          done();
        } else {
          console.info(TAG + "Get preferences success");
          expect(preferences !== null).assertTrue();
          try {
            preferences.put(KEY_TEST_STRING_ELEMENT, "test", (err) => {
              if (err) {
                console.info(TAG + "Put preferences err: " + err);
                return;
              }
              console.info(TAG + "Put preferences success");
              preferences.get(KEY_TEST_STRING_ELEMENT, "defaultvalue", (err, ret) => {
                expect("test").assertEqual(ret);
                dataPreferences.deletePreferences(context, {
                  name: "getPreferencesTest1"
                }, (err) => {
                  preferences.get(KEY_TEST_STRING_ELEMENT, "defaultvalue", (err, pre) => {
                    expect("test").assertEqual(pre);
                    done();
                  });
                });
              });
            });
            expect(preferences !== null).assertTrue();
            done();
          } catch (err) {
            console.info("testPreferencesDeletePreferences006 fail: " + err.message + "code: " + err.code);
            expect(!err).assertTrue();
            done();
          }
        }
      });
    });

    /**
     * @tc.number : SUB_DistributedData_CrossPlatform_SDK_Preferences_RemoveJSAPITest_0900
     * @tc.name   : testRemovePreferencesFromCache0001
     * @tc.desc   : RemovePreferencesFromCache callback interface test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRemovePreferencesFromCache0001", 0, async (done: Function) => {
      dataPreferences.getPreferences(context, NAME, (err, preferences) => {
        if (err) {
          console.info(TAG + "Get preferences err: " + err);
          expect(!err).assertTrue();
        } else {
          console.info(TAG + "Get preferences success");
          expect(preferences !== null).assertTrue();
          dataPreferences.removePreferencesFromCache(context, NAME, (err) => {
            console.info(TAG + "Remove preferences from cache success");
            expect(!err).assertTrue();
            done();
          });
        }
      });
    });

    /**
     * @tc.number : SUB_DistributedData_CrossPlatform_SDK_Preferences_RemoveJSAPITest_0200
     * @tc.name   : testRemovePreferencesFromCache001
     * @tc.desc   : RemovePreferencesFromCache callback interface test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRemovePreferencesFromCache001", 0, async (done: Function) => {
      dataPreferences.getPreferences(context, NAME, (err, preferences) => {
        if (err) {
          console.info(TAG + "Get preferences err: " + err);
          expect(!err).assertTrue();
        } else {
          console.info(TAG + "Get preferences success");
          expect(preferences !== null).assertTrue();
          try {
            dataPreferences.removePreferencesFromCache(context, null, (err) => {
              if (err) {
                console.info(TAG + "Remove preferences from cache error: " + err);
                expect(!err).assertFail();
                done();
              }
            });
            expect(!err).assertFail();
            done();
          } catch (err) {
            console.info("testRemovePreferencesFromCache001 fail: " + err.message + "code: " + err.code);
            expect('401').assertEqual(err.code);
            done();
          }
        }
      });
    });

    /**
     * @tc.number : SUB_DistributedData_CrossPlatform_SDK_Preferences_RemoveJSAPITest_0100
     * @tc.name   : testRemovePreferencesFromCache003
     * @tc.desc   : RemovePreferencesFromCache callback interface test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRemovePreferencesFromCache003", 0, async (done: Function) => {
      dataPreferences.getPreferences(context, NAME, (err, preferences) => {
        if (err) {
          console.info(TAG + "Get preferences err: " + err);
          expect(!err).assertTrue();
          done();
        } else {
          console.info(TAG + "Get preferences success");
          expect(preferences !== null).assertTrue();
          try {
            preferences.put(KEY_TEST_STRING_ELEMENT, "test", (err) => {
              if (err) {
                console.info(TAG + "Put preferences err: " + err);
                return;
              }
              console.info(TAG + "Put preferences success");
              preferences.get(KEY_TEST_STRING_ELEMENT, "defaultvalue", (err, ret) => {
                expect("test").assertEqual(ret);
                dataPreferences.removePreferencesFromCache(context, "getPreferencesTest1", (err) => {
                  preferences.get(KEY_TEST_STRING_ELEMENT, "defaultvalue", (err, pre) => {
                    expect("test").assertEqual(pre);
                    done();
                  });
                });
              });
            });
          } catch (err) {
            console.info("testRemovePreferencesFromCache003 fail: " + err.message + "code: " + err.code);
            expect(!err).assertTrue();
            done();
          }
        }
      });
    });

    /**
     * @tc.number : SUB_DistributedData_CrossPlatform_SDK_Preferences_RemoveJSAPITest_0400
     * @tc.name   : testRemovePreferencesFromCache004
     * @tc.desc   : RemovePreferencesFromCache callback interface test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRemovePreferencesFromCache004", 0, async (done: Function) => {
      dataPreferences.getPreferences(context, {
        name: NAME
      }, (err, preferences) => {
        if (err) {
          console.info(TAG + "Get preferences err: " + err);
          expect(!err).assertTrue();
        } else {
          console.info(TAG + "Get preferences success");
          expect(preferences !== null).assertTrue();
          dataPreferences.removePreferencesFromCache(context, {
            name: NAME
          }, (err) => {
            console.info(TAG + "Remove preferences from cache success");
            expect(!err).assertTrue();
            done();
          });
          done();
        }
      });
    });

    /**
     * @tc.number : SUB_DistributedData_CrossPlatform_SDK_Preferences_RemoveJSAPITest_0400
     * @tc.name   : testRemovePreferencesFromCache005
     * @tc.desc   : RemovePreferencesFromCache callback interface test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRemovePreferencesFromCache005", 0, async (done: Function) => {
      dataPreferences.getPreferences(context, {
        name: NAME
      }, (err, preferences) => {
        if (err) {
          console.info(TAG + "Get preferences err: " + err);
          expect(!err).assertTrue();
        } else {
          console.info(TAG + "Get preferences success");
          expect(preferences !== null).assertTrue();
          try {
            dataPreferences.removePreferencesFromCache(context, {
              name: null
            }, (err) => {
              expect(!err).assertFail();
              done();
            });
            expect(!err).assertFail();
            done();
          } catch (err) {
            console.info("testRemovePreferencesFromCache005 fail: " + err.message + "code: " + err.code);
            expect("401").assertEqual(err.code);
            done();
          }
        }
      });
    });

    /**
     * @tc.number : SUB_DistributedData_CrossPlatform_SDK_Preferences_RemoveJSAPITest_0500
     * @tc.name   : testRemovePreferencesFromCache006
     * @tc.desc   : RemovePreferencesFromCache callback interface test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testRemovePreferencesFromCache006", 0, async (done: Function) => {
      dataPreferences.getPreferences(context, NAME, (err, preferences) => {
        if (err) {
          console.info(TAG + "Get preferences err: " + err);
          expect(!err).assertTrue();
        } else {
          console.info(TAG + "Get preferences success");
          expect(preferences !== null).assertTrue();
          try {
            preferences.put(KEY_TEST_STRING_ELEMENT, "test", (err) => {
              if (err) {
                console.info(TAG + "Put preferences err: " + err);
                return;
              }
              console.info(TAG + "Put preferences success");
              preferences.get(KEY_TEST_STRING_ELEMENT, "defaultvalue", (err, ret) => {
                expect("test").assertEqual(ret);
                dataPreferences.removePreferencesFromCache(context, {
                  name: "getPreferencesTest1"
                }, (err) => {
                  preferences.get(KEY_TEST_STRING_ELEMENT, "defaultvalue", (err, pre) => {
                    expect("test").assertEqual(pre);
                    done();
                  });
                });
              });
            });
          } catch (err) {
            console.info("testRemovePreferencesFromCache006 fail: " + err.message + "code: " + err.code);
            expect(!err).assertTrue();
            done();
          }
        }
      });
    });

    /**
     * @tc.number : SUB_DistributedData_CrossPlatform_SDK_Preferences_GetJSAPITest_3200
     * @tc.name   : testPreferencesGetDefaultValue0001
     * @tc.desc   : Get defaultValue callback interface test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testPreferencesGetDefaultValue0001", 0, async (done: Function) => {
      await mPreferences.clear();
      await mPreferences.get(KEY_TEST_STRING_ELEMENT, "defaultValue", (err, ret) => {
        expect("defaultValue").assertEqual(ret);
        done();
      });
    });

    /**
     * @tc.number : SUB_DistributedData_CrossPlatform_SDK_Preferences_GetJSAPITest_3300
     * @tc.name   : testPreferencesGetFloat0001
     * @tc.desc   : Get float callback interface test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testPreferencesGetFloat0001", 0, async (done: Function) => {
      await mPreferences.clear();
      await mPreferences.put(KEY_TEST_FLOAT_ELEMENT, 3.0);
      await mPreferences.get(KEY_TEST_FLOAT_ELEMENT, 0.0, (err, ret) => {
        expect(3.0).assertEqual(ret);
        done();
      });
    });

    /**
     * @tc.number : SUB_DistributedData_CrossPlatform_SDK_Preferences_GetJSAPITest_3400
     * @tc.name   : testPreferencesGetInt0001
     * @tc.desc   : Get int callback interface test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testPreferencesGetInt0001", 0, async (done: Function) => {
      await mPreferences.clear();
      await mPreferences.put(KEY_TEST_INT_ELEMENT, 3);
      await mPreferences.get(KEY_TEST_INT_ELEMENT, 0.0, (err, ret) => {
        expect(3).assertEqual(ret);
        done();
      });
    });

    /**
     * @tc.number : SUB_DistributedData_CrossPlatform_SDK_Preferences_GetJSAPITest_3500
     * @tc.name   : testPreferencesGetLong0001
     * @tc.desc   : Get long callback interface test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testPreferencesGetLong0001", 0, async (done: Function) => {
      await mPreferences.clear();
      await mPreferences.put(KEY_TEST_LONG_ELEMENT, 3);
      await mPreferences.get(KEY_TEST_LONG_ELEMENT, 0, (err, ret) => {
        expect(3).assertEqual(ret);
        done();
      });
    });

    /**
     * @tc.number : SUB_DistributedData_CrossPlatform_SDK_Preferences_GetJSAPITest_3800

     * @tc.name   : testPreferencesGetString001
     * @tc.desc   : Get String callback interface test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testPreferencesGetString001", 0, async (done: Function) => {
      await mPreferences.clear();
      await mPreferences.put(KEY_TEST_STRING_ELEMENT, "test");
      await mPreferences.flush();
      await mPreferences.get(KEY_TEST_STRING_ELEMENT, "defaultvalue", (err, ret) => {
        expect("test").assertEqual(ret);
        done();
      });
    });

    /**
     * @tc.number : SUB_DistributedData_CrossPlatform_SDK_Preferences_GetJSAPITest_3100

     * @tc.name   : testPreferencesGetBoolean0001
     * @tc.desc   : Get Boolean callback interface test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testPreferencesGetBoolean0001", 0, async (done: Function) => {
      await mPreferences.clear();
      await mPreferences.put(KEY_TEST_STRING_ELEMENT, true);
      await mPreferences.get(KEY_TEST_BOOLEAN_ELEMENT, true, (err, ret) => {
        expect(true).assertEqual(ret);
        done();
      });
    });

    /**
     * @tc.number : SUB_DistributedData_CrossPlatform_SDK_Preferences_GetJSAPITest_3700
     * @tc.name   : testPreferencesGetStringArray001
     * @tc.desc   : Get StringArray callback interface test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testPreferencesGetStringArray001", 0, async (done: Function) => {
      await mPreferences.clear();
      let stringArr = ["11", "22", "33"];
      await mPreferences.put(KEY_TEST_STRING_ARRAY_ELEMENT, stringArr);
      mPreferences.get(KEY_TEST_STRING_ARRAY_ELEMENT, ["123", "321"], (err, pre) => {
        for (let i = 0; i < stringArr.length; i++) {
          expect(stringArr[i]).assertEqual(pre[i]);
        }
        done();
      });
    });

    /**
     * @tc.number : SUB_DistributedData_CrossPlatform_SDK_Preferences_GetJSAPITest_3600

     * @tc.name   : testPreferencesGetNumArray001
     * @tc.desc   : Get NumArray callback interface test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testPreferencesGetNumArray001", 0, async (done: Function) => {
      await mPreferences.clear();
      let doubleArr = [11, 22, 33];
      await mPreferences.put(KEY_TEST_NUMBER_ARRAY_ELEMENT, doubleArr);
      mPreferences.get(KEY_TEST_NUMBER_ARRAY_ELEMENT, [123, 321], (err, pre) => {
        for (let i = 0; i < doubleArr.length; i++) {
          expect(doubleArr[i]).assertEqual(pre[i]);
        }
        done();
      });
    });

    /**
     * @tc.number : SUB_DistributedData_CrossPlatform_SDK_Preferences_GetJSAPITest_3000
     * @tc.name   : testPreferencesGetBoolArray0001
     * @tc.desc   : Get BoolArray callback interface test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testPreferencesGetBoolArray0001", 0, async (done: Function) => {
      await mPreferences.clear();
      let boolArr = [true, false, false, true];
      await mPreferences.put(KEY_TEST_BOOL_ARRAY_ELEMENT, boolArr);
      mPreferences.get(KEY_TEST_BOOL_ARRAY_ELEMENT, [true, false], (err, pre) => {
        for (let i = 0; i < boolArr.length; i++) {
          expect(boolArr[i]).assertEqual(pre[i]);
        }
        done();
      });
    });

    /**
     * @tc.number : SUB_DistributedData_CrossPlatform_SDK_Preferences_GetJSAPITest_1700
     * @tc.name   : testPreferencesGetAll0001
     * @tc.desc   : GetAll callback interface test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testPreferencesGetAll0001", 0, async (done: Function) => {
      await mPreferences.clear();
      let doubleArr = [11, 22, 33];
      let stringArr = ["11", "22", "33"];
      let boolArr = [true, false, false, true];
      await mPreferences.put(KEY_TEST_STRING_ARRAY_ELEMENT, stringArr);
      await mPreferences.put(KEY_TEST_BOOL_ARRAY_ELEMENT, boolArr);
      await mPreferences.put(KEY_TEST_NUMBER_ARRAY_ELEMENT, doubleArr);
      await mPreferences.put(KEY_TEST_BOOLEAN_ELEMENT, false);
      await mPreferences.put(KEY_TEST_STRING_ELEMENT, "123");
      await mPreferences.put(KEY_TEST_FLOAT_ELEMENT, 123.1);

      await mPreferences.flush();

      await mPreferences.getAll((err: BusinessError, value: Object) => {
        let obj = value as Record<string, object>;
        expect(false).assertEqual(obj.key_test_boolean);
        expect("123").assertEqual(obj.key_test_string);
        expect(123.1).assertEqual(obj.key_test_float);
        let sArr = obj.key_test_string_array as Array<string>;
        for (let i = 0; i < sArr.length; i++) {
          expect(sArr[i]).assertEqual(stringArr[i]);
        }

        let bArr = obj.key_test_bool_array as Array<boolean>;
        for (let i = 0; i < bArr.length; i++) {
          expect(bArr[i]).assertEqual(boolArr[i]);
        }

        let nArr = obj.key_test_number_array as Array<number>;
        for (let i = 0; i < nArr.length; i++) {
          expect(nArr[i]).assertEqual(doubleArr[i]);
        }

        done();
      });
    });

    /**
     * @tc.number : SUB_DistributedData_CrossPlatform_SDK_Preferences_PutJSAPITest_2900
     * @tc.name   : testPreferencesPutFloat0001
     * @tc.desc   : Put float callback interface test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testPreferencesPutFloat0001", 0, async (done: Function) => {
      await mPreferences.clear();
      await mPreferences.put(KEY_TEST_FLOAT_ELEMENT, 4.0, async (err, ret) => {
        let pre = await mPreferences.get(KEY_TEST_FLOAT_ELEMENT, 0.0);
        expect(4.0).assertEqual(pre);
        await mPreferences.flush();
        let pre2 = await mPreferences.get(KEY_TEST_FLOAT_ELEMENT, 0.0);
        expect(4.0).assertEqual(pre2);
        done();
      });
    });

    /**
     * @tc.number : SUB_DistributedData_CrossPlatform_SDK_Preferences_PutJSAPITest_3000
     * @tc.name   : testPreferencesPutInt0001
     * @tc.desc   : Put int callback interface test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testPreferencesPutInt0001", 0, async (done: Function) => {
      await mPreferences.clear();
      await mPreferences.put(KEY_TEST_INT_ELEMENT, 4, async (err, ret) => {
        let pre = await mPreferences.get(KEY_TEST_INT_ELEMENT, 0);
        expect(4).assertEqual(pre);
        await mPreferences.flush();
        let pre2 = await mPreferences.get(KEY_TEST_INT_ELEMENT, 0);
        expect(4).assertEqual(pre2);
        done();
      });
    });

    /**
     * @tc.number : SUB_DistributedData_CrossPlatform_SDK_Preferences_PutJSAPITest_3100
     * @tc.name   : testPreferencesPutLong0001
     * @tc.desc   : Put long callback interface test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testPreferencesPutLong0001", 0, async (done: Function) => {
      await mPreferences.clear();
      await mPreferences.put(KEY_TEST_LONG_ELEMENT, 4);
      await mPreferences.put(KEY_TEST_LONG_ELEMENT, 4, async (err, ret) => {
        let pre = await mPreferences.get(KEY_TEST_LONG_ELEMENT, 0);
        expect(4).assertEqual(pre);
        await mPreferences.flush();
        let pre2 = await mPreferences.get(KEY_TEST_LONG_ELEMENT, 0);
        expect(4).assertEqual(pre2);
        done();
      });
    });

    /**
     * @tc.number : SUB_DistributedData_CrossPlatform_SDK_Preferences_PutJSAPITest_3400
     * @tc.name   : testPreferencesPutString0001
     * @tc.desc   : Put String callback interface test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testPreferencesPutString0001", 0, async (done: Function) => {
      await mPreferences.clear();
      await mPreferences.put(KEY_TEST_STRING_ELEMENT, "", async (err, ret) => {
        let pre = await mPreferences.get(KEY_TEST_STRING_ELEMENT, "defaultvalue");
        expect("").assertEqual(pre);
        await mPreferences.flush();
        let pre2 = await mPreferences.get(KEY_TEST_STRING_ELEMENT, "defaultvalue");
        expect("").assertEqual(pre2);
        done();
      });
    });

    /**
     * @tc.number : SUB_DistributedData_CrossPlatform_SDK_Preferences_PutJSAPITest_2800
     * @tc.name   : testPreferencesPutBoolean0001
     * @tc.desc   : Put Boolean callback interface test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testPreferencesPutBoolean0001", 0, async (done: Function) => {
      await mPreferences.clear();
      await mPreferences.put(KEY_TEST_BOOLEAN_ELEMENT, true, async (err, ret) => {
        let pre = await mPreferences.get(KEY_TEST_BOOLEAN_ELEMENT, false);
        expect(true).assertEqual(pre);
        await mPreferences.flush();
        let pre2 = await mPreferences.get(KEY_TEST_BOOLEAN_ELEMENT, false);
        expect(true).assertEqual(pre2);
        done();
      });
    });

    /**
     * @tc.number : SUB_DistributedData_CrossPlatform_SDK_Preferences_PutJSAPITest_3300
     * @tc.name   : testPreferencesPutStringArray0001
     * @tc.desc   : Put StringArray callback interface test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testPreferencesPutStringArray0001", 0, async (done: Function) => {
      await mPreferences.clear();
      let stringArr = ["11", "22", "33"];
      await mPreferences.put(KEY_TEST_STRING_ARRAY_ELEMENT, stringArr, async (err, ret) => {
        let pre = await mPreferences.get(KEY_TEST_STRING_ARRAY_ELEMENT, ["123", "321"]);
        for (let i = 0; i < stringArr.length; i++) {
          expect(stringArr[i]).assertEqual(pre[i]);
        }

        done();
      });
    });

    /**
     * @tc.number : SUB_DistributedData_CrossPlatform_SDK_Preferences_PutJSAPITest_3200
     * @tc.name   : testPreferencesPutNumArray0001
     * @tc.desc   : Put NumberArray callback interface test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testPreferencesPutNumArray0001", 0, async (done: Function) => {
      await mPreferences.clear();
      let doubleArr = [11, 22, 33];
      await mPreferences.put(KEY_TEST_NUMBER_ARRAY_ELEMENT, doubleArr, async (err, ret) => {
        let pre = await mPreferences.get(KEY_TEST_NUMBER_ARRAY_ELEMENT, [123, 321]);
        for (let i = 0; i < doubleArr.length; i++) {
          expect(doubleArr[i]).assertEqual(pre[i]);
        }

        done();
      });
    });

    /**
     * @tc.number : SUB_DistributedData_CrossPlatform_SDK_Preferences_PutJSAPITest_2700
     * @tc.name   : testPreferencesPutBoolArray0001
     * @tc.desc   : Put BoolArray callback interface test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testPreferencesPutBoolArray0001", 0, async (done: Function) => {
      await mPreferences.clear();
      let boolArr = [true, false, false, true];
      await mPreferences.put(KEY_TEST_BOOL_ARRAY_ELEMENT, boolArr, async (err, ret) => {
        let pre = await mPreferences.get(KEY_TEST_BOOL_ARRAY_ELEMENT, [true, false]);
        for (let i = 0; i < boolArr.length; i++) {
          expect(boolArr[i]).assertEqual(pre[i]);
        }

        done();
      });
    });

    /**
     * @tc.number : SUB_DistributedData_CrossPlatform_SDK_Preferences_HasJSAPITest_1400
     * @tc.name   : testPreferencesHasKey0005
     * @tc.desc   : Has float callback interface test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testPreferencesHasKey0005", 0, async (done: Function) => {
      await mPreferences.put(KEY_TEST_FLOAT_ELEMENT, 1.1);
      await mPreferences.has(KEY_TEST_FLOAT_ELEMENT, (err, ret) => {
        expect(true).assertEqual(ret);
        done();
      });
    });

    /**
     * @tc.number : SUB_DistributedData_CrossPlatform_SDK_Preferences_HasJSAPITest_1500
     * @tc.name   : testPreferencesHasKey0001
     * @tc.desc   : Has int callback interface test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testPreferencesHasKey0001", 0, async (done: Function) => {
      await mPreferences.put(KEY_TEST_INT_ELEMENT, 1);
      await mPreferences.has(KEY_TEST_INT_ELEMENT, (err, ret) => {
        expect(true).assertEqual(ret);
        done();
      });
    });

    /**
     * @tc.number : SUB_DistributedData_CrossPlatform_SDK_Preferences_HasJSAPITest_1600
     * @tc.name   : testPreferencesHasKey0002
     * @tc.desc   : Has long callback interface test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testPreferencesHasKey0002", 0, async (done: Function) => {
      await mPreferences.put(KEY_TEST_LONG_ELEMENT, 0);
      await mPreferences.has(KEY_TEST_LONG_ELEMENT, (err, ret) => {
        expect(true).assertEqual(ret);
        done();
      });
    });

    /**
     * @tc.number : SUB_DistributedData_CrossPlatform_SDK_Preferences_HasJSAPITest_1700
     * @tc.name   : testPreferencesHasKey0003
     * @tc.desc   : Has string callback interface test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testPreferencesHasKey0003", 0, async (done: Function) => {
      await mPreferences.put(KEY_TEST_STRING_ELEMENT, "test");
      await mPreferences.has(KEY_TEST_STRING_ELEMENT, (err, ret) => {
        expect(true).assertEqual(ret);
        done();
      });
    });

    /**
     * @tc.number : SUB_DistributedData_CrossPlatform_SDK_Preferences_HasJSAPITest_1300
     * @tc.name   : testPreferencesHasKey0004
     * @tc.desc   : Has boolean callback interface test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testPreferencesHasKey0004", 0, async (done: Function) => {
      await mPreferences.put(KEY_TEST_BOOLEAN_ELEMENT, false);
      await mPreferences.has(KEY_TEST_BOOLEAN_ELEMENT, (err, ret) => {
        expect(true).assertEqual(ret);
        done();
      });
    });

    /**
     * @tc.number : SUB_DistributedData_CrossPlatform_SDK_Preferences_ClearJSAPITest_0500
     * @tc.name   : testPreferencesClear0001
     * @tc.desc   : Clear callback interface test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testPreferencesClear0001", 0, async (done: Function) => {
      await mPreferences.clear();
      let doubleArr = [11, 22, 33];
      let stringArr = ["11", "22", "33"];
      let boolArr = [true, false, false, true];
      await mPreferences.put(KEY_TEST_STRING_ARRAY_ELEMENT, stringArr);
      await mPreferences.put(KEY_TEST_BOOL_ARRAY_ELEMENT, boolArr);
      await mPreferences.put(KEY_TEST_NUMBER_ARRAY_ELEMENT, doubleArr);
      await mPreferences.put(KEY_TEST_BOOLEAN_ELEMENT, false);
      await mPreferences.put(KEY_TEST_STRING_ELEMENT, "123");
      await mPreferences.put(KEY_TEST_FLOAT_ELEMENT, 123.1);

      await mPreferences.flush();

      let value = mPreferences.getAllSync() as Record<string, object>;
      let obj = value as Record<string, object>;
      expect(false).assertEqual(obj.key_test_boolean);
      expect("123").assertEqual(obj.key_test_string);
      expect(123.1).assertEqual(obj.key_test_float);
      let sArr = obj.key_test_string_array as Array<string>;
      for (let i = 0; i < sArr.length; i++) {
        expect(sArr[i]).assertEqual(stringArr[i]);
      }

      let bArr = obj.key_test_bool_array as Array<boolean>;
      for (let i = 0; i < bArr.length; i++) {
        expect(bArr[i]).assertEqual(boolArr[i]);
      }

      let nArr = obj.key_test_number_array as Array<number>;
      for (let i = 0; i < nArr.length; i++) {
        expect(nArr[i]).assertEqual(doubleArr[i]);
      }

      await mPreferences.clear(async (err) => {
        let ret = mPreferences.getAllSync() as Record<string, object>;
        console.log("testPreferencesClear0001 end." + JSON.stringify(ret.key_test_string));
        expect(undefined).assertEqual(ret.key_test_boolean);
        expect(undefined).assertEqual(ret.key_test_string);
        expect(undefined).assertEqual(ret.key_test_float);
        expect(undefined).assertEqual(ret.key_test_string_array);
        expect(undefined).assertEqual(ret.key_test_bool_array);
        expect(undefined).assertEqual(ret.key_test_number_array);
        done();
      });
    });

    /**
     * @tc.number : SUB_DistributedData_CrossPlatform_SDK_Preferences_DeleteJSAPITest_2400
     * @tc.name   : testPreferencesDelete0010
     * @tc.desc   : Delete callback interface test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testPreferencesDelete0010", 0, async (done: Function) => {
      await mPreferences.put(KEY_TEST_FLOAT_ELEMENT, 3.0);
      let ret = await mPreferences.get(KEY_TEST_FLOAT_ELEMENT, 0.0);
      expect(3.0).assertEqual(ret);
      await mPreferences.flush();
      mPreferences.delete(KEY_TEST_FLOAT_ELEMENT, async (err, ret) => {
        if (err) {
          console.info("Failed to delete the key KEY_TEST_STRING_ELEMENT. code =" + err.code + ", message =" + err.message);
          expect(!err).assertTrue();
        }
        console.info("Succeeded in deleting the key KEY_TEST_STRING_ELEMENT.");
        let per = await mPreferences.get(KEY_TEST_FLOAT_ELEMENT, 0.0);
        expect(0.0).assertEqual(per);
        done();
      });
    });

    /**
     * @tc.number : SUB_DistributedData_CrossPlatform_SDK_Preferences_FlushJSAPITest_0400
     * @tc.name   : testPreferenceCB001
     * @tc.desc   : Flush callback interface test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testPreferenceCB001", 0, async (done: Function) => {
      await mPreferences.clear();
      await mPreferences.put(KEY_TEST_STRING_ELEMENT, "test");
      await mPreferences.flush();
      mPreferences.flush(async (err, val) => {
        if (err) {
          console.info("Failed to flush. code =" + err.code + ", message =" + err.message);
          expect(!err).assertTrue();
        }
        console.info("Succeeded in flushing.");
        expect(err === undefined).assertTrue();
        let per = await mPreferences.get(KEY_TEST_STRING_ELEMENT, "defaultvalue");
        expect("test").assertEqual(per);
        done();
      });
    });

    /**
     * @tc.number : SUB_DistributedData_CrossPlatform_SDK_Preferences_JSAPITest_0200
     * @tc.name   : testPreferencesCallback001
     * @tc.desc   : Clear、Put、Get、Flush String callback interface test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testPreferencesCallback001", 0, (done: Function) => {
      console.log(TAG + "testPreferencesCallback001 begin.");
      mPreferences.clear((err, val) => {
        if (err) {
          expect(!err).assertTrue();
        }
        mPreferences.put(KEY_TEST_STRING_ELEMENT, "123", (err) => {
          if (err) {
            expect(!err).assertTrue();
          }
          mPreferences.get(KEY_TEST_STRING_ELEMENT, "defaultvalue", (err, pre) => {
            if (err) {
              expect(!err).assertTrue();
            }
            expect("123").assertEqual(pre);
            mPreferences.flush((err) => {
              if (err) {
                expect(!err).assertTrue();
              }
              mPreferences.get(KEY_TEST_STRING_ELEMENT, "defaultvalue", (err, pre2) => {
                if (err) {
                  expect(!err).assertTrue();
                }
                expect("123").assertEqual(pre2);
                done();
                console.log(TAG + "testPreferencesCallback001 end.");
              });
            });
          });
        });
      });
    });
  });
}