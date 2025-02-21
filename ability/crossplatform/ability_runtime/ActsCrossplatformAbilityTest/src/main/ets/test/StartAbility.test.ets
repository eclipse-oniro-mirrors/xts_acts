/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import {
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
} from "@ohos/hypium";
import AbilityDelegatorRegistry from "@ohos.app.ability.abilityDelegatorRegistry";
import {Driver, ON, Component} from "@ohos.UiTest";

let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();

export default function StartAbilityTest() {
  let TAG = '';
  describe("StartAbilityTest", function () {
    function sleep(time) {
      return new Promise((resolve) => setTimeout(resolve, time));
    }

    beforeEach(async  function(done) {
      await sleep(500);
      done();
    })
    
    afterAll(async  function(done){
      let driver = Driver.create();
      let componentCounter = await driver.findComponent(ON.text("知道了"));
      if(componentCounter){
        componentCounter.click();
      }
      await sleep(500);
      done();
    })

    afterEach(async function (done) {
      console.log(TAG, ' afterEach start');
      let intervalId;
      let count = 0;
      if (globalThis.main3Context) {
        console.log(TAG, ' terminateSelf main3 start');
        globalThis.main3Context.terminateSelf();
        intervalId = setInterval(()=>{
          count ++;
          if (count > 10 || !globalThis.main3Context) {
            console.log(TAG, ' terminateSelf main3 end');
            clearInterval(intervalId);
            done();
          }
        }, 200)
      } else if (globalThis.main4AbilityContext) {
        console.log(TAG, ' terminateSelf main4 start');
        globalThis.main4AbilityContext.terminateSelf()
        intervalId = setInterval(()=>{
          count ++;
          if (count > 10 || !globalThis.main4AbilityContext) {
            console.log(TAG, ' terminateSelf main4 end');
            clearInterval(intervalId);
            done();
          }
        }, 200)
      } else {
        console.log(TAG, ' afterEach end');
        done();
      }
    });

    /**
     * @tc.number ACTS_START_ABILITY_CALLBACK_0001
     * @tc.name actsStartAbilityCallback0001
     * @tc.desc Test the api "abilityDelegator.startAbility", return the result with callback function.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("ACTS_START_ABILITY_CALLBACK_0001", 0, async function (done) {
      TAG = 'ACTS_START_ABILITY_CALLBACK_0001';
      console.log(TAG, ' start');
      const want = {
        bundleName: "com.example.delegatortest",
        moduleName: "entry",
        abilityName: "Main4Ability",
      };
      setTimeout(() => {
        console.log(TAG, ' timeout1 start');
        abilityDelegator.startAbility(want, () => {
          console.log(TAG, ' startAbility callback');
          abilityDelegator.printSync(
            "ACTS_STARTABILITY_CALLBACK_0001 startAbility callback"
          );
          setTimeout(() => {
            console.log(TAG, ' timeout2 start');
            try {
              abilityDelegator.getCurrentTopAbility(
                (err: any, ability: any) => {
                  console.log(TAG, ' getCurrentTopAbility callback, ability != null' + (ability != null));
                  if (ability != null) {
                    abilityDelegator.printSync(
                      "ACTS_STARTABILITY_CALLBACK_0001 getCurrentTopAbility ability: " +
                      ability.context.abilityInfo.name
                    );
                    console.log(TAG, ' ability:' + JSON.stringify(ability));
                    expect(ability.context.abilityInfo.name === "Main4Ability").assertTrue();
                    abilityDelegator.printSync(
                      "ACTS_STARTABILITY_CALLBACK_0001 pass."
                    );
                    done();
                  } else {
                    console.log(TAG, ' getCurrentTopAbility end,ability is null,err=' + JSON.stringify(err));
                    abilityDelegator.printSync(
                      "ACTS_STARTABILITY_CALLBACK_0001 getCurrentTopAbility callback meet an error: not found ability"
                    );
                    expect().assertFail();
                    done();
                  }
                }
              );
            } catch(e) {
              console.log(TAG, ' getCurrentTopAbility fail, e=' + JSON.stringify(e));
              expect().assertFail();
              done();
            }
          }, 2000);
        });
      }, 2000);
    });

    /**
     * @tc.number ACTS_START_ABILITY_CALLBACK_PARAMETER_0002
     * @tc.name actsStartAbilityCallbackParameter0002
     * @tc.desc Test the api: startAbility, want contain 'parameters'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it("ACTS_START_ABILITY_CALLBACK_PARAMETER_0002", 0, async function (done) {
      TAG = 'ACTS_START_ABILITY_CALLBACK_PARAMETER_0002';
      console.log(TAG, ' start');
      const want = {
        moduleName: "entry",
        bundleName: "com.example.delegatortest",
        abilityName: "Main3Ability",
        parameters: {
          keyForString: "test start",
          keyForInt: 100,
          keyForDouble: 99.99,
          keyForBoolean: true,
        },
      };
      abilityDelegator.startAbility(want, () => {
        console.log(TAG, ' startAbility callback');
        abilityDelegator.printSync(
          "ACTS_START_ABILITY_CALLBACK_PARAMETER_0002 startAbility callback"
        );
        setTimeout(() => {
          console.log(TAG, ' timeout callback');
          try {
            abilityDelegator.getCurrentTopAbility((err: any, ability: any) => {
              console.log(TAG, ' getCurrentTopAbility success, err=', + JSON.stringify(err));
              console.log(TAG, ' getCurrentTopAbility success, ability=', + JSON.stringify(ability));
              abilityDelegator.printSync(
                "ACTS_START_ABILITY_CALLBACK_PARAMETER_0002 getCurrentTopAbility: " +
                ability.context.abilityInfo.name
              );
              expect(ability.context.abilityInfo.name).assertEqual(
                "Main3Ability"
              );
              console.log(TAG, ' globalThis.want=', + JSON.stringify(globalThis.want));
              expect(globalThis.want.parameters["keyForString"]).assertEqual(
                "test start"
              );
              expect(globalThis.want.parameters["keyForInt"]).assertEqual(100);
              expect(globalThis.want.parameters["keyForDouble"]).assertEqual(
                99.99
              );
              expect(globalThis.want.parameters["keyForBoolean"]).assertEqual(
                true
              );
              console.log(TAG, "ACTS_START_ABILITY_CALLBACK_PARAMETER_0002 pass");
              done();
            });
          } catch (error) {
            console.log(TAG, "ACTS_START_ABILITY_CALLBACK_PARAMETER_0002 fail :" + error);
            expect().assertFail();
            done();
          }
        }, 3000);
      });
    });

    /**
     * @tc.number ACTS_START_ABILITY_PROMISE_0001
     * @tc.name actsStartAbilityPromise0001
     * @tc.desc Test the api "abilityDelegator.startAbility", return the result with callback function.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("ACTS_START_ABILITY_PROMISE_0001", 0, async function (done) {
      TAG = 'ACTS_START_ABILITY_PROMISE_0001';
      console.log(TAG, ' start');
      const want = {
        moduleName: "entry",
        bundleName: "com.example.delegatortest",
        abilityName: "Main4Ability",
      };
      console.log(TAG, ' startAbility start');
      abilityDelegator.startAbility(want).then((data)=>{
        console.log(TAG, ' startAbility promise success');
        setTimeout(()=>{
          abilityDelegator.getCurrentTopAbility((err: any, ability: any) => {
            console.log(TAG, ' getCurrentTopAbility callback, err=' + JSON.stringify(err));
            console.log(TAG, ' getCurrentTopAbility callback, ability=' + JSON.stringify(ability));
            expect(ability.context.abilityInfo.name).assertEqual("Main4Ability");
            console.log(TAG, " ACTS_STARTABILITY_PROMISE_0001 pass");
            done();
          });
        }, 3000)
      }).catch((e)=>{
        console.log(TAG, " startAbility promise pass");
        console.log(TAG, ' catch error, e=' + JSON.stringify(e));
        expect().assertFail();
        done();
      })
    });

    /**
     * @tc.number ACTS_START_ABILITY_PROMISE_PARAMETER_0002
     * @tc.name actsStartAbilityPromiseParameter0002
     * @tc.desc Test the api: startAbility, want contain 'parameters'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it("ACTS_START_ABILITY_PROMISE_PARAMETER_0002", 0, async function (done) {
      TAG = 'ACTS_START_ABILITY_PROMISE_PARAMETER_0002';
      console.log(TAG, ' start');
      const want = {
        moduleName: "entry",
        bundleName: "com.example.delegatortest",
        abilityName: "Main3Ability",
        parameters: {
          keyForString: "test start",
          keyForInt: 100,
          keyForDouble: 99.99,
          keyForBoolean: true,
        },
      };
      await abilityDelegator.startAbility(want).then((data) => {
        console.log(TAG, ' startAbility promise, data=', JSON.stringify(data));
        setTimeout(() => {
          try {
            abilityDelegator.getCurrentTopAbility((err: any, ability: any) => {
              console.log(TAG, ' getCurrentTopAbility callback, err=', JSON.stringify(err));
              console.log(TAG, ' getCurrentTopAbility callback, ability=', JSON.stringify(ability));
              abilityDelegator.printSync(
                "ACTS_START_ABILITY_PROMISE_PARAMETER_0002 getCurrentTopAbility: " +
                ability.context.abilityInfo.name
              );

              expect(ability.context.abilityInfo.name).assertEqual(
                "Main3Ability"
              );
              console.log(TAG, ' getCurrentTopAbility callback, globalThis.want=', JSON.stringify(globalThis.want));
              expect(globalThis.want.parameters["keyForString"]).assertEqual(
                "test start"
              );
              expect(globalThis.want.parameters["keyForInt"]).assertEqual(100);
              expect(globalThis.want.parameters["keyForDouble"]).assertEqual(
                99.99
              );
              expect(globalThis.want.parameters["keyForBoolean"]).assertEqual(
                true
              );
              console.log("ACTS_START_ABILITY_PROMISE_PARAMETER_0002 pass");
              done()
            });
          } catch (error) {
            console.log(TAG, ' getCurrentTopAbility catch error, error=', JSON.stringify(error));
            console.log(
              "ACTS_START_ABILITY_PROMISE_PARAMETER_0002 fail :" + error
            );
            expect().assertFail();
            done();
          }
        }, 3000);
      });
    });

    /**
     * @tc.number ACTS_START_ABILITY_PROMISE_ERROR_0001
     * @tc.name actsStartAbilityPromiseError0001
     * @tc.desc Test the api: startAbility, start an ability which bundle is not exist, expect it return an error named "startAbility failed".
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it("ACTS_START_ABILITY_PROMISE_ERROR_0001", 0, async function (done) {
      TAG = 'ACTS_START_ABILITY_PROMISE_ERROR_0001';
      console.log(TAG, ' start');
      const want = {
        moduleName: "entry",
        bundleName: "com.example.error",
        abilityName: "Main4Ability",
      };
      try {
        await abilityDelegator
          .startAbility(want)
          .then((data) => {
            console.log(TAG, ' startAbility promise, data=', JSON.stringify(data));
            abilityDelegator.printSync(
              "ACTS_STARTABILITY_PROMISE_ERROR_0001 data: " + data
            );
            expect().assertFail();
          })
          .catch((error) => {
            console.log(TAG, ' startAbility promise, catch error, error=', JSON.stringify(error));
            abilityDelegator.printSync(
              "ACTS_STARTABILITY_PROMISE_ERROR_0001 meet an error: " + error
            );
            abilityDelegator.printSync(
              "ACTS_STARTABILITY_PROMISE_ERROR_0001 meet an error code: " +
              error.code
            );
            expect(error.code != null).assertTrue();
            expect(error.message).assertEqual("startAbility failed.");
            abilityDelegator.printSync(
              "ACTS_STARTABILITY_PROMISE_ERROR_0001 pass"
            );
            done();
          });
      } catch (error) {
        console.log(TAG, ' try catch error, error=', JSON.stringify(error));
        abilityDelegator.printSync(
          "ACTS_STARTABILITY_PROMISE_ERROR_0001 fail error: " + error
        );
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number ACTS_START_ABILITY_PROMISE_ERROR_0002
     * @tc.name actsStartAbilityPromiseError0002
     * @tc.desc Test the api: startAbility, bundlename is the error value, abilityname does not pass in the value, modulename is the correct value, expect it return an error named "startAbility failed".
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it("ACTS_START_ABILITY_PROMISE_ERROR_0002", 0, async function (done) {
      TAG = 'ACTS_START_ABILITY_PROMISE_ERROR_0002';
      console.log(TAG, ' start');
      const want = {
        bundleName: "com.example.delegatortest",
        moduleName: "entry",
      };
      try {
        await abilityDelegator
          .startAbility(want)
          .then((data) => {
            console.log(TAG, ' startAbility promise, data=', JSON.stringify(data))
            abilityDelegator.printSync(
              "ACTS_START_ABILITY_PROMISE_ERROR_0002 data: " + data
            );
            expect().assertFail();
          })
          .catch((error) => {
            console.log(TAG, ' startAbility promise error, error=', JSON.stringify(error))
            abilityDelegator.printSync(
              "ACTS_START_ABILITY_PROMISE_ERROR_0002 meet an error: " + error
            );
            abilityDelegator.printSync(
              "ACTS_START_ABILITY_PROMISE_ERROR_0002 meet an error code: " +
              error.code
            );
            expect(error.code != null).assertTrue();
            expect(error.message).assertEqual("startAbility failed.");
            abilityDelegator.printSync(
              "ACTS_START_ABILITY_PROMISE_ERROR_0002 pass"
            );
            done();
          });
      } catch (error) {
        console.log(TAG, ' try catch error, error=', JSON.stringify(error));
        abilityDelegator.printSync(
          "ACTS_START_ABILITY_PROMISE_ERROR_0002 fail error: " + error
        );
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number ACTS_START_ABILITY_PROMISE_ERROR_0003
     * @tc.name actsStartAbilityPromiseError0003
     * @tc.desc Test the api: startAbility, start an ability which BundleName does not pass in a value, AbilityName is the correct value, and ModuleName is the correct value, expect it return an error named "startAbility failed".
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it("ACTS_START_ABILITY_PROMISE_ERROR_0003", 0, async function (done) {
      TAG = 'ACTS_START_ABILITY_PROMISE_ERROR_0003';
      console.log(TAG, ' start');
      const want = {
        moduleName: "entry",
        abilityName: "Main4Ability",
      };
      try {
        await abilityDelegator
          .startAbility(want)
          .then((data) => {
            console.log(TAG, ' startAbility promise, data=', JSON.stringify(data))
            abilityDelegator.printSync(
              "ACTS_START_ABILITY_PROMISE_ERROR_0003 data: " + data
            );
            expect().assertFail();
          })
          .catch((error) => {
            console.log(TAG, ' startAbility promise error, error=', JSON.stringify(error))
            abilityDelegator.printSync(
              "ACTS_START_ABILITY_PROMISE_ERROR_0003 meet an error: " + error
            );
            abilityDelegator.printSync(
              "ACTS_START_ABILITY_PROMISE_ERROR_0003 meet an error code: " +
              error.code
            );
            expect(error.code != null).assertTrue();
            expect(error.message).assertEqual("startAbility failed.");
            abilityDelegator.printSync(
              "ACTS_START_ABILITY_PROMISE_ERROR_0003 pass"
            );
            done();
          });
      } catch (error) {
        console.log(TAG, ' try catch error, error=', JSON.stringify(error));
        abilityDelegator.printSync(
          "ACTS_START_ABILITY_PROMISE_ERROR_0003 fail error: " + error
        );
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number ACTS_START_ABILITY_PROMISE_ERROR_0006
     * @tc.name actsStartAbilityPromiseError0006
     * @tc.desc Test the api: startAbility, want is empty, expect it return an error named "startAbility failed".
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it("ACTS_START_ABILITY_PROMISE_ERROR_0006", 0, async function (done) {
      TAG = 'ACTS_START_ABILITY_PROMISE_ERROR_0006';
      console.log(TAG, ' start');
      const want = {};
      try {
        await abilityDelegator
          .startAbility(want)
          .then((data) => {
            console.log(TAG, ' startAbility promise, data=', JSON.stringify(data))
            abilityDelegator.printSync(
              "ACTS_START_ABILITY_PROMISE_ERROR_0006 data: " + data
            );
            expect().assertFail();
          })
          .catch((error) => {
            console.log(TAG, ' startAbility promise error, error=', JSON.stringify(error))
            abilityDelegator.printSync(
              "ACTS_START_ABILITY_PROMISE_ERROR_0006 meet an error: " + error
            );
            abilityDelegator.printSync(
              "ACTS_START_ABILITY_PROMISE_ERROR_0006 meet an error code: " +
              error.code
            );
            expect(error.code != null).assertTrue();
            expect(error.message).assertEqual("startAbility failed.");
            abilityDelegator.printSync(
              "ACTS_START_ABILITY_PROMISE_ERROR_0006 pass"
            );
            done();
          });
      } catch (error) {
        console.log(TAG, ' try catch error, error=', JSON.stringify(error));
        abilityDelegator.printSync(
          "ACTS_START_ABILITY_PROMISE_ERROR_0006 fail error: " + error
        );
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.number ACTS_START_ABILITY_PROMISE_ERROR_0007
     * @tc.name actsStartAbilityPromiseError0007
     * @tc.desc Test the api: startAbility, want is undefined, expect it return an error named "startAbility failed".
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it("ACTS_START_ABILITY_PROMISE_ERROR_0007", 0, async function (done) {
      TAG = 'ACTS_START_ABILITY_PROMISE_ERROR_0007';
      console.log(TAG, ' start');
      const want = undefined;
      try {
        await abilityDelegator
          .startAbility(want)
          .then((data) => {
            console.log(TAG, ' startAbility promise, data=', JSON.stringify(data))
            abilityDelegator.printSync(
              "ACTS_START_ABILITY_PROMISE_ERROR_0007 data: " + data
            );
            expect().assertFail();
          })
          .catch((error) => {
            console.log(TAG, ' startAbility promise error, error=', JSON.stringify(error))
            abilityDelegator.printSync(
              "ACTS_START_ABILITY_PROMISE_ERROR_0007 meet an error: " + error
            );
            expect(error.message).assertEqual("Incorrect parameters.");
            abilityDelegator.printSync(
              "ACTS_START_ABILITY_PROMISE_ERROR_0007 pass"
            );
            done();
          });
      } catch (error) {
        console.log(TAG, ' try catch error, error=', JSON.stringify(error));
        abilityDelegator.printSync(
          "ACTS_START_ABILITY_PROMISE_ERROR_0007 fail error: " + error
        );
        abilityDelegator.printSync(
          "ACTS_START_ABILITY_PROMISE_ERROR_0007 meet an error code: " +
          error.code
        );
        expect(error.code).assertEqual(401);
        done();
      }
    });

    /**
     * @tc.number ACTS_START_ABILITY_CALLBACK_ERROR_0001
     * @tc.name actsStartAbilityCallbackError0001
     * @tc.desc Test the api: startAbility, start an ability which bundleName is the error value, AbilityName is the correct value, and ModuleName is the correct value named "startAbility failed".
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it("ACTS_START_ABILITY_CALLBACK_ERROR_0001", 0, async function (done) {
      TAG = 'ACTS_START_ABILITY_CALLBACK_ERROR_0001';
      console.log(TAG, ' start');
      const want = {
        moduleName: "entry",
        bundleName: "com.example.error",
        abilityName: "Main4Ability",
      };
      abilityDelegator.startAbility(want, (err: any, data: any) => {
        console.log(TAG, ' startAbility callback, err=' + JSON.stringify(err));
        console.log(TAG, ' startAbility callback, data=' + JSON.stringify(data));
        abilityDelegator.printSync(
          "ACTS_START_ABILITY_CALLBACK_ERROR_0001 startAbility callback"
        );
        try {
          if (err != null) {
            abilityDelegator.printSync(
              "ACTS_START_ABILITY_CALLBACK_ERROR_0001 meet an error: " +
              err.code
            );
            abilityDelegator.printSync(
              "ACTS_START_ABILITY_CALLBACK_ERROR_0001 meet an error: " +
              err.message
            );
            expect(err.code != null).assertTrue();
            expect(err.message).assertEqual("startAbility failed.");
            abilityDelegator.printSync(
              "ACTS_START_ABILITY_CALLBACK_ERROR_0001 pass"
            );
          } else {
            abilityDelegator.printSync(
              "ACTS_START_ABILITY_CALLBACK_ERROR_0001 error"
            );
            expect().assertFail();
          }
          done();
        } catch (e) {
          console.log(TAG, ' catch err, e=' + JSON.stringify(e));
          abilityDelegator.printSync(
            "ACTS_START_ABILITY_CALLBACK_ERROR_0001 meet an error: " + e
          );
          expect().assertFail();
          done();
        }
      });
    });

    /**
     * @tc.number ACTS_START_ABILITY_CALLBACK_ERROR_0002
     * @tc.name actsStartAbilityCallbackError0002
     * @tc.desc Test the api: startAbility, start an ability which bundlename is the error value, abilityname does not pass in the value, modulename is the correct value, expect it return an error named "startAbility failed".
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it("ACTS_START_ABILITY_CALLBACK_ERROR_0002", 0, async function (done) {
      TAG = 'ACTS_START_ABILITY_CALLBACK_ERROR_0002';
      console.log(TAG, ' start');
      const want = {
        bundleName: "com.example.delegatortest",
        moduleName: "entry",
      };

      abilityDelegator.startAbility(want, (err: any, data: any) => {
        console.log(TAG, ' startAbility callback, err=' + JSON.stringify(err));
        console.log(TAG, ' startAbility callback, data=' + JSON.stringify(data));
        abilityDelegator.printSync(
          "ACTS_START_ABILITY_CALLBACK_ERROR_0002 startAbility callback"
        );
        try {
          if (err != null) {
            abilityDelegator.printSync(
              "ACTS_START_ABILITY_CALLBACK_ERROR_0002 meet an error: " +
              err.code
            );
            abilityDelegator.printSync(
              "ACTS_START_ABILITY_CALLBACK_ERROR_0002 meet an error: " +
              err.message
            );
            expect(err.code != null).assertTrue();
            expect(err.message).assertEqual("startAbility failed.");
            abilityDelegator.printSync(
              "ACTS_START_ABILITY_CALLBACK_ERROR_0002 pass"
            );
          } else {
            abilityDelegator.printSync(
              "ACTS_START_ABILITY_CALLBACK_ERROR_0002 error"
            );
            expect().assertFail();
          }
          done();
        } catch (e) {
          console.log(TAG, ' catch err, e=' + JSON.stringify(e));
          abilityDelegator.printSync(
            "ACTS_START_ABILITY_CALLBACK_ERROR_0002 meet an error: " + e
          );
          expect().assertFail();
          done();
        }
      });
    });

    /**
     * @tc.number ACTS_START_ABILITY_CALLBACK_ERROR_0003
     * @tc.name actsStartAbilityCallbackError0003
     * @tc.desc Test the api: startAbility, BundleName does not pass in a value, AbilityName is the correct value, and ModuleName is the correct value, expect it return an error named "startAbility failed".
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it("ACTS_START_ABILITY_CALLBACK_ERROR_0003", 0, async function (done) {
      TAG = 'ACTS_START_ABILITY_CALLBACK_ERROR_0003';
      console.log(TAG, ' start');
      const want = {
        moduleName: "entry",
        abilityName: "Main4Ability",
      };

      abilityDelegator.startAbility(want, (err: any, data: any) => {
        console.log(TAG, ' startAbility callback, err=' + JSON.stringify(err));
        console.log(TAG, ' startAbility callback, data=' + JSON.stringify(data));
        abilityDelegator.printSync(
          "ACTS_STARTABILITY_CALLBACK_ERROR_0003 startAbility callback"
        );
        try {
          if (err != null) {
            console.log(TAG, ' startAbility callback err != null');
            abilityDelegator.printSync(
              "ACTS_STARTABILITY_CALLBACK_ERROR_0003 meet an error: " + err.code
            );
            abilityDelegator.printSync(
              "ACTS_STARTABILITY_CALLBACK_ERROR_0003 meet an error: " +
              err.message
            );
            expect(err.code != null).assertTrue();
            expect(err.message).assertEqual("startAbility failed.");
            abilityDelegator.printSync(
              "ACTS_STARTABILITY_CALLBACK_ERROR_0003 pass"
            );
          } else {
            abilityDelegator.printSync(
              "ACTS_STARTABILITY_CALLBACK_ERROR_0003 error"
            );
            expect().assertFail();
          }
          done();
        } catch (e) {
          console.log(TAG, ' catch err, e=' + JSON.stringify(e));
          abilityDelegator.printSync(
            "ACTS_STARTABILITY_CALLBACK_ERROR_0003 meet an error: " + e
          );
          expect().assertFail();
          done();
        }
      });
    });

    /**
     * @tc.number ACTS_START_ABILITY_CALLBACK_ERROR_0006
     * @tc.name actsStartAbilityCallbackError0006
     * @tc.desc Test the api: startAbility, want is empty, expect it return an error named "startAbility failed".
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it("ACTS_START_ABILITY_CALLBACK_ERROR_0006", 0, async function (done) {
      TAG = 'ACTS_START_ABILITY_CALLBACK_ERROR_0006';
      console.log(TAG, ' start');
      const want = {};
      abilityDelegator.startAbility(want, (err: any, data: any) => {
        console.log(TAG, ' startAbility callback, err=' + JSON.stringify(err));
        console.log(TAG, ' startAbility callback, data=' + JSON.stringify(data));
        abilityDelegator.printSync(
          "ACTS_START_ABILITY_CALLBACK_ERROR_0006 startAbility callback"
        );
        try {
          if (err != null) {
            console.log(TAG, ' startAbility callback err != null');
            abilityDelegator.printSync(
              "ACTS_START_ABILITY_CALLBACK_ERROR_0006 meet an error: " +
              err.code
            );
            abilityDelegator.printSync(
              "ACTS_START_ABILITY_CALLBACK_ERROR_0006 meet an error: " +
              err.message
            );
            expect(err.code != null).assertTrue();
            expect(err.message).assertEqual("startAbility failed.");
            abilityDelegator.printSync(
              "ACTS_START_ABILITY_CALLBACK_ERROR_0006 pass"
            );
          } else {
            abilityDelegator.printSync(
              "ACTS_START_ABILITY_CALLBACK_ERROR_0006 error"
            );
            expect().assertFail();
          }
          done();
        } catch (e) {
          console.log(TAG, ' catch err, e=' + JSON.stringify(e));
          abilityDelegator.printSync(
            "ACTS_START_ABILITY_CALLBACK_ERROR_0006 meet an error: " + e
          );
          expect().assertFail();
          done();
        }
      });
    });

    /**
     * @tc.number ACTS_START_ABILITY_CALLBACK_ERROR_0007
     * @tc.name actsStartAbilityCallbackError0007
     * @tc.desc Test the api: startAbility,want is undefined, expect it return an error named "startAbility failed".
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it("ACTS_START_ABILITY_CALLBACK_ERROR_0007", 0, async function (done) {
      TAG = 'ACTS_START_ABILITY_CALLBACK_ERROR_0007';
      console.log(TAG, ' start');
      const want = undefined;
      try {
        abilityDelegator.startAbility(want, (err: any, data: any) => {
          console.log(TAG, ' startAbility callback, err=' + JSON.stringify(err));
          console.log(TAG, ' startAbility callback, data=' + JSON.stringify(data));
          abilityDelegator.printSync(
            "ACTS_START_ABILITY_CALLBACK_ERROR_0007 startAbility callback"
          );
          expect().assertFail();
          done();
        });
      } catch (e) {
        console.log(TAG, ' startAbility catch error, e=' + JSON.stringify(e));
        abilityDelegator.printSync(
          "ACTS_START_ABILITY_CALLBACK_ERROR_0007 meet an error: " + e
        );
        abilityDelegator.printSync(
          "ACTS_START_ABILITY_CALLBACK_ERROR_0007 meet an error: " + e.code
        );
        expect(e.message).assertEqual("Incorrect parameters.");
        expect(e.code).assertEqual(401);
        abilityDelegator.printSync(
          "ACTS_START_ABILITY_CALLBACK_ERROR_0007 pass"
        );
        done();
      }
    });
  });
}
