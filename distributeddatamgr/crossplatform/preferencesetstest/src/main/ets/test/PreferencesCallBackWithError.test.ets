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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium";
import data_preferences from "@ohos.data.preferences";
import common from "@ohos.app.ability.common";

const NAME = "test_preferences_callback_with_error";
const KEY_TEST_INT_ELEMENT = "key_test_int";
const KEY_TEST_STRING_ELEMENT = "key_test_string";
let mPreference = undefined;
let context: common.UIAbilityContext ;

export default function preferencesCallbackWithErrorTest() {
  describe("preferencesCallbackWithErrorTest", function () {
    beforeAll(async function () {
      console.info("beforeAll");
      context = AppStorage.get<common.UIAbilityContext>("TestAbilityContext") as common.UIAbilityContext;
      console.info("context=======>"+context);
      mPreference = await data_preferences.getPreferences(context, NAME);
    });

    afterAll(async function () {
      console.info("afterAll");
      await data_preferences.deletePreferences(context, NAME);
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_Preferences_JSAPITest_0300
     * @tc.name   : testPreferencesCallbackWithError0000
     * @tc.desc   : Clear、Put、Has、Delete、Get、Flush String callback interface test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testPreferencesCallbackWithError0000", 0, function (done) {
      console.log("testPreferencesCallbackWithError0000 begin.");
      try {
        mPreference.clear(function (err, val) {
          if (err) {
            console.log("clear err =" + err + ", code =" + err.code + ", message =" + err.message);
            expect(!err).assertTrue();
          }
          mPreference.put(KEY_TEST_STRING_ELEMENT, "abc", function (err, ret) {
            if (err) {
              console.log("put err =" + err + ", code =" + err.code + ", message =" + err.message);
              expect(!err).assertTrue();
            }
            mPreference.get(KEY_TEST_STRING_ELEMENT, "defaultvalue", function (err, pre) {
              if (err) {
                console.log("get err =" + err + ", code =" + err.code + ", message =" + err.message);
                expect(!err).assertTrue();
              }
              expect("abc").assertEqual(pre);
              mPreference.flush(function (err, val) {
                if (err) {
                  console.log("flush err =" + err + ", code =" + err.code + ", message =" + err.message);
                  expect(!err).assertTrue();
                }
                mPreference.delete(KEY_TEST_STRING_ELEMENT, function (err) {
                  expect(!err).assertTrue();
                  console.log("Succeeded in deleting .");
                  done();
                  console.log("testPreferencesCallbackWithError0000 end.");
                });
              });
            });
          });
        });
      } catch (err) {
        console.log("trycatch err =" + err + ", code =" + err.code + ", message =" + err.message);
        expect(!err).assertTrue();
      }
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_Preferences_GetJSAPITest_4000
     * @tc.name   : testMpreferencesGet0000
     * @tc.desc   : mPreference.get callback test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testMpreferencesGet0000", 0, function (done) {
      console.log("testMpreferencesGet0000 begin.");
      try {
        mPreference.get(123, function (err, val) {
          console.log("get err");
          expect(!err).assertFail();
        });
        done();
      } catch (err) {
        console.log("trycatch err =" + err + ", code =" + err.code + ", message =" + err.message);
        expect("401").assertEqual(err.code);
        done();
        console.log("testMpreferencesGet0000 end.");
      }
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_Preferences_GetJSAPITest_3900
     * @tc.name   : testMpreferencesGet0001
     * @tc.desc   : mPreference.get callback test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testMpreferencesGet0001", 0, function (done) {
      console.log("testMpreferencesGet0001 begin.");
      try {
        mPreference.get(-1, 123, function (err, val) {
          if (err) {
            console.log("get err =" + err + ", code =" + err.code + ", message =" + err.message);
            expect(!err).assertFail();
            done();
          }
          done();
          console.log("testMpreferencesGet0001 end.");
          expect(!err).assertFail();
          done();
        });
      } catch (err) {
        console.log("trycatch err =" + err + ", code =" + err.code + ", message =" + err.message);
        expect("401").assertEqual(err.code);
        done();
      }
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_Preferences_GetJSAPITest_4100
     * @tc.name   : testMpreferencesGet0002
     * @tc.desc   : mPreference.get callback test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testMpreferencesGet0002", 0, async function (done) {
      console.log("testMpreferencesGet0002 begin.");
      try {
        await mPreference.put(KEY_TEST_INT_ELEMENT, 3);
        mPreference.get(KEY_TEST_STRING_ELEMENT, 123, function (err, val) {
          if (err) {
            console.log("get err =" + err + ", code =" + err.code + ", message =" + err.message);
            expect(!err).assertTrue();
            done();
          }
          expect(val !== 3).assertTrue();
          done();
          console.log("testMpreferencesGet0002 end.");
        });
      } catch (err) {
        console.log("trycatch err =" + err + ", code =" + err.code + ", message =" + err.message);
        expect(!err).assertTrue();
        done();
      }
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_Preferences_GetJSAPITest_1600
     * @tc.name   : testMpreferencesGetALL0000
     * @tc.desc   : mPreference.getAll callback test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testMpreferencesGetALL0000", 0, function (done) {
      console.log("testMpreferencesGetALL0000 begin.");
      try {
        mPreference.getAll(function (err, val) {
          if (err) {
            console.log("getAll err =" + err + ", code =" + err.code + ", message =" + err.message);
            expect(!err).assertTrue();
          }
          expect(!err).assertTrue();
          done();
          console.log("testMpreferencesGetALL0000 end.");
        });
      } catch (err) {
        console.log("trycatch err =" + err + ", code =" + err.code + ", message =" + err.message);
        expect(!err).assertTrue();
      }
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_Preferences_HasJSAPITest_1800
     * @tc.name   : testMpreferencesHas0001
     * @tc.desc   : mPreference.has callback test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testMpreferencesHas0001", 0, function (done) {
      console.log("testMpreferencesHas0001 begin.");
      try {
        mPreference.has(123, function (err, val) {
          console.log("has err");
          expect(!err).assertFail();
        });
        expect(mPreference !== null).assertFail();
        done();
      } catch (err) {
        console.log("trycatch err =" + err + ", code =" + err.code + ", message =" + err.message);
        expect("401").assertEqual(err.code);
        done();
        console.log("testMpreferencesHas0001 end.");
      }
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_Preferences_HasJSAPITest_1900
     * @tc.name   : testMpreferencesHas0002
     * @tc.desc   : mPreference.has callback test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testMpreferencesHas0002", 0, function (done) {
      console.log("testMpreferencesHas0002 begin.");
      try {
        mPreference.has(KEY_TEST_STRING_ELEMENT, function (err, val) {
          if (err) {
            console.log("has err =" + err + ", code =" + err.code + ", message =" + err.message);
            expect(!err).assertTrue();
          }
          expect(!err).assertTrue();
          done();
          console.log("testMpreferencesHas0002 end.");
        });
      } catch (err) {
        console.log("trycatch err =" + err + ", code =" + err.code + ", message =" + err.message);
        expect(!err).assertTrue();
      }
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_Preferences_PutJSAPITest_3900

     * @tc.name   : testMpreferencesPut0001
     * @tc.desc   : mPreference.put callback test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testMpreferencesPut0001", 0, function (done) {
      console.log("testMpreferencesPut0001 begin.");
      try {
        mPreference.put(123, function (err) {
          console.log("put err");
          expect(!err).assertFail();
        });
        expect(mPreference !== null).assertFail();
        done();
      } catch (err) {
        console.log("trycatch err =" + err + ", code =" + err.code + ", message =" + err.message);
        expect("401").assertEqual(err.code);
        done();
        console.log("testMpreferencesPut0001 end.");
      }
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_Preferences_PutJSAPITest_3700
     * @tc.name   : testMpreferencesPut0002
     * @tc.desc   : mPreference.put callback test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testMpreferencesPut0002", 0, function (done) {
      console.log("testMpreferencesPut0002 begin.");
      try {
        mPreference.put(KEY_TEST_STRING_ELEMENT, "", async (err) => {
          if (err) {
            console.log("put err =" + err + ", code =" + err.code + ", message =" + err.message);
            expect(!err).assertTrue();
            done();
          }
          let pre = await mPreference.get(KEY_TEST_STRING_ELEMENT, "123");
          expect(pre === "").assertTrue();
          done();
          console.log("testMpreferencesPut0002 end.");
        });
      } catch (err) {
        console.log("trycatch err =" + err + ", code =" + err.code + ", message =" + err.message);
        expect(!err).assertTrue();
        done();
      }
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_Preferences_PutJSAPITest_3600

     * @tc.name   : testMpreferencesPut0003
     * @tc.desc   : mPreference.put callback test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testMpreferencesPut0003", 0, function (done) {
      console.log("testMpreferencesPut0003 begin.");
      try {
        mPreference.put(KEY_TEST_STRING_ELEMENT, " ", async (err) => {
          if (err) {
            console.log("put err =" + err + ", code =" + err.code + ", message =" + err.message);
            expect(!err).assertTrue();
            done();
          }
          let pre = await mPreference.get(KEY_TEST_STRING_ELEMENT, "123");
          expect(pre === " ").assertTrue();
          done();
          console.log("testMpreferencesPut0003 end.");
        });
      } catch (err) {
        console.log("trycatch err =" + err + ", code =" + err.code + ", message =" + err.message);
        expect(!err).assertTrue();
        done();
      }
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_Preferences_PutJSAPITest_3400
     * @tc.name   : testMpreferencesPut0004
     * @tc.desc   : mPreference.put callback test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testMpreferencesPut0004", 0, function (done) {
      console.log("testMpreferencesPut0004 begin.");
      try {
        mPreference.put(-1, 123, function (err) {
          if (err) {
            console.log("put err =" + err + ", code =" + err.code + ", message =" + err.message);
            expect(!err).assertFail();
            done();
          }
          expect(!err).assertFail();
          done();
          console.log("testMpreferencesPut0004 end.");
        });
        expect(mPreference !== null).assertFail();
        done();
      } catch (err) {
        console.log("trycatch err =" + err + ", code =" + err.code + ", message =" + err.message);
        expect("401").assertEqual(err.code);
        done();
      }
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_Preferences_PutJSAPITest_3800
     * @tc.name   : testMpreferencesPut0005
     * @tc.desc   : mPreference.put callback test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testMpreferencesPut0005", 0, function (done) {
      console.log("testMpreferencesPut0005 begin.");
      try {
        mPreference.put(KEY_TEST_STRING_ELEMENT, null, function (err) {
          if (err) {
            console.log("put err =" + err + ", code =" + err.code + ", message =" + err.message);
            expect(!err).assertFail();
            done();
          }
          expect(!err).assertFail();
          done();
          console.log("testMpreferencesPut0005 end.");
        });
        expect(mPreference !== null).assertFail();
        done();
      } catch (err) {
        console.log("trycatch err =" + err + ", code =" + err.code + ", message =" + err.message);
        expect("401").assertEqual(err.code);
        done();
      }
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_Preferences_DeleteJSAPITest_2100
     * @tc.name   : testMpreferencesDelete0001
     * @tc.desc   : mPreference.delete callback test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testMpreferencesDelete0001", 0, function (done) {
      console.log("testMpreferencesDelete0001 begin.");
      try {
        mPreference.delete(1233, function (err) {
          console.log("delete err");
          expect(!err).assertFail();
        });
        expect(mPreference !== null).assertFail();
        done();
      } catch (err) {
        console.log("trycatch err =" + err + ", code =" + err.code + ", message =" + err.message);
        expect("401").assertEqual(err.code);
        done();
        console.log("testMpreferencesDelete0001 end.");
      }
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_Preferences_DeleteJSAPITest_2300
     * @tc.name   : testMpreferencesDelete0002
     * @tc.desc   : mPreference.delete callback test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testMpreferencesDelete0002", 0, function (done) {
      console.log("testMpreferencesDelete0002 begin.");
      try {
        mPreference.delete(KEY_TEST_STRING_ELEMENT, function (err) {
          if (err) {
            console.log("delete err =" + err + ", code =" + err.code + ", message =" + err.message);
            expect(!err).assertFail();
          }
          expect(!err).assertTrue();
          done();
          console.log("testMpreferencesDelete0002 end.");
        });
        expect(mPreference !== null).assertTrue();
        done();
      } catch (err) {
        console.log("trycatch err =" + err + ", code =" + err.code + ", message =" + err.message);
        expect(!err).assertTrue();
      }
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_Preferences_ClearJSAPITest_0400
     * @tc.name   : testMpreferencesClear0001
     * @tc.desc   : mPreference.clear callback test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testMpreferencesClear0001", 0, function (done) {
      console.log("testMpreferencesClear0001 begin.");
      try {
        mPreference.clear(function (err) {
          if (err) {
            console.log("clear err =" + err + ", code =" + err.code + ", message =" + err.message);
            expect(!err).assertTrue();
          }
          expect(!err).assertTrue();
          done();
          console.log("testMpreferencesClear0001 end.");
        });
      } catch (err) {
        console.log("trycatch err =" + err + ", code =" + err.code + ", message =" + err.message);
        expect(!err).assertTrue();
        done();
      }
    });

    /**
     * @tc.number : SUB_DistributeData_CrossPlatform_SDK_Preferences_FlushJSAPITest_0300
     * @tc.name   : testMpreferencesFlush0001
     * @tc.desc   : mPreference.flush callback test
     * @tc.size   : MediumTest
     * @tc.type   : Function
     * @tc.level  : Level 2
     */
    it("testMpreferencesFlush0001", 0, function (done) {
      console.log("testMpreferencesFlush0001 begin.");
      try {
        mPreference.flush(function (err) {
          if (err) {
            console.log("flush err =" + err + ", code =" + err.code + ", message =" + err.message);
            expect(!err).assertTrue();
          }
          expect(!err).assertTrue();
          done();
          console.log("testMpreferencesFlush0001 end.");
        });
      } catch (err) {
        console.log("trycatch err =" + err + ", code =" + err.code + ", message =" + err.message);
        expect(!err).assertTrue();
        done();
      }
    });
  });
}
