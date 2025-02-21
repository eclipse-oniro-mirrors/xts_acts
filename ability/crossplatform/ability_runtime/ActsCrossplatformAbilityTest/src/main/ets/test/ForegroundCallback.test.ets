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

//@ts-nocheck
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

let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
const START_ABILITY_TIMEOUT_TWO_THOUSAND = 2000;

export default function ForegroundCallback() {
  describe("ForegroundCallback", function () {
    /**
     * @tc.number ACTS_DO_ABILITY_FOREGROUND_CALLBACK_0001
     * @tc.name actsDoAbilityForegroundCallback0001
     * @tc.desc Test the api: doAbilityForeground, swith the ability forground.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("ACTS_DO_ABILITY_FOREGROUND_CALLBACK_0001", 0, async function (done) {
      let wantMain = {
        abilityName: "Main3Ability",
        bundleName: "com.example.delegatortest",
        moduleName: "entry",
      };

      let wantMain2 = {
        abilityName: "Main4Ability",
        bundleName: "com.example.delegatortest",
        moduleName: "entry",
      };

      abilityDelegator.printSync(
        "ACTS_DO_ABILITY_FOREGROUND_CALLBACK_0001 start"
      );
      setTimeout(() => {
        abilityDelegator.startAbility(wantMain2, () => {
          setTimeout(() => {
            abilityDelegator.getCurrentTopAbility((err: any, ability1: any) => {
              abilityDelegator.printSync(
                "ACTS_DO_ABILITY_FOREGROUND_CALLBACK_0001 Main4Ability: " +
                  ability1.context.abilityInfo.name
              );
              abilityDelegator.startAbility(wantMain, () => {
                setTimeout(() => {
                  abilityDelegator.getCurrentTopAbility(
                    (err: any, ability2: any) => {
                      abilityDelegator.printSync(
                        "ACTS_DO_ABILITY_FOREGROUND_CALLBACK_0001 Main3Ability: " +
                          ability2.context.abilityInfo.name
                      );
                      abilityDelegator.doAbilityForeground(
                        ability1,
                        (err: any) => {
                          setTimeout(() => {
                            abilityDelegator.getCurrentTopAbility(
                              (err: any, ability3: any) => {
                                try {
                                  abilityDelegator.printSync(
                                    "ACTS_DO_ABILITY_FOREGROUND_CALLBACK_0001 Main4Ability: " +
                                      ability3.context.abilityInfo.name
                                  );
                                  var stateNum =
                                    abilityDelegator.getAbilityState(ability3);
                                  abilityDelegator.printSync(
                                    "ACTS_DO_ABILITY_FOREGROUND_CALLBACK_0001 getAbilityState stateNum :" +
                                      stateNum
                                  );
                                  expect(stateNum).assertEqual(2);
                                  abilityDelegator.printSync(
                                    "ACTS_DO_ABILITY_FOREGROUND_CALLBACK_0001 pass"
                                  );
                                } catch (error) {
                                  abilityDelegator.printSync(
                                    "ACTS_DO_ABILITY_FOREGROUND_CALLBACK_0001 error:" +
                                      error
                                  );
                                }
                                done();
                              }
                            );
                          }, START_ABILITY_TIMEOUT_TWO_THOUSAND);
                        }
                      );
                    }
                  );
                }, START_ABILITY_TIMEOUT_TWO_THOUSAND);
              });
            });
          }, START_ABILITY_TIMEOUT_TWO_THOUSAND);
        });
      }, START_ABILITY_TIMEOUT_TWO_THOUSAND);
    });

    /**
     * @tc.number ACTS_DO_ABILITY_FOREGROUND_CALLBACK_ERROR_0002
     * @tc.name actsDoAbilityForegroundCallbackError0002
     * @tc.desc Test the api: doAbilityForeground, swith the wrong ability forground.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      "ACTS_DO_ABILITY_FOREGROUND_CALLBACK_ERROR_0002",
      0,
      async function (done) {
        let wantMain = {
          abilityName: "Main3Ability",
          bundleName: "com.example.delegatortest",
          moduleName: "entry",
        };
        abilityDelegator.printSync(
          "ACTS_DO_ABILITY_FOREGROUND_CALLBACK_ERROR_0002 start"
        );
        abilityDelegator.getCurrentTopAbility((err: any, ability1: any) => {
          abilityDelegator.printSync(
            "ACTS_DO_ABILITY_FOREGROUND_CALLBACK_ERROR_0002 Main4Ability: " +
              ability1.context.abilityInfo.name
          );
          abilityDelegator.startAbility(wantMain, () => {
            abilityDelegator.printSync(
              "ACTS_DO_ABILITY_FOREGROUND_CALLBACK_ERROR_0002 startAbility"
            );
            setTimeout(() => {
              try {
                abilityDelegator.doAbilityForeground(
                  ability1 + "error",
                  (err: any) => {
                    abilityDelegator.printSync(
                      "ACTS_DO_ABILITY_FOREGROUND_CALLBACK_ERROR_0002 fail"
                    );
                    expect().assertFail();
                    done();
                  }
                );
              } catch {
                abilityDelegator.printSync(
                  "ACTS_DO_ABILITY_FOREGROUND_CALLBACK_ERROR_0002 doAbilityForeground meet an error: ability is wrong"
                );
                abilityDelegator.getCurrentTopAbility(
                  (err: any, ability2: any) => {
                    abilityDelegator.printSync(
                      "ACTS_DO_ABILITY_FOREGROUND_CALLBACK_ERROR_0002 Main3Ability : " +
                        ability2.context.abilityInfo.name
                    );
                    var stateNum = abilityDelegator.getAbilityState(ability1);
                    abilityDelegator.printSync(
                      "ACTS_DO_ABILITY_FOREGROUND_CALLBACK_ERROR_0002 getAbilityState: " +
                        stateNum
                    );
                    expect(stateNum).assertEqual(3);
                    expect(ability2.context.abilityInfo.name).assertEqual(
                      "Main3Ability"
                    );
                    abilityDelegator.printSync(
                      "ACTS_DO_ABILITY_FOREGROUND_CALLBACK_ERROR_0002 pass."
                    );
                    done();
                  }
                );
              }
            }, START_ABILITY_TIMEOUT_TWO_THOUSAND);
          });
        });
      }
    );

    /**
     * @tc.number ACTS_DO_ABILITY_FOREGROUND_CALLBACK_ERROR_0003
     * @tc.name actsDoAbilityForegroundCallbackError0003
     * @tc.desc Test the api: doAbilityForeground, swith the empty ability forground.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      "ACTS_DO_ABILITY_FOREGROUND_CALLBACK_ERROR_0003",
      0,
      async function (done) {
        let wantMain2 = {
          abilityName: "Main4Ability",
          bundleName: "com.example.delegatortest",
          moduleName: "entry",
        };
        abilityDelegator.printSync(
          "ACTS_DO_ABILITY_FOREGROUND_CALLBACK_ERROR_0003 start"
        );
        abilityDelegator.getCurrentTopAbility((err: any, ability1: any) => {
          abilityDelegator.printSync(
            "ACTS_DO_ABILITY_FOREGROUND_CALLBACK_ERROR_0003 Main3Ability: " +
              ability1.context.abilityInfo.name
          );
          abilityDelegator.startAbility(wantMain2, () => {
            abilityDelegator.printSync(
              "ACTS_DO_ABILITY_FOREGROUND_CALLBACK_ERROR_0003 startAbility"
            );
            setTimeout(() => {
              try {
                abilityDelegator.doAbilityForeground("", (err: any) => {
                  abilityDelegator.printSync(
                    "ACTS_DO_ABILITY_FOREGROUND_CALLBACK_ERROR_0003 fail"
                  );
                  expect().assertFail();
                  done();
                });
              } catch {
                abilityDelegator.printSync(
                  "ACTS_DO_ABILITY_FOREGROUND_CALLBACK_ERROR_0003 doAbilityForeground meet an error: ability is null"
                );
                abilityDelegator.getCurrentTopAbility(
                  (err: any, ability2: any) => {
                    abilityDelegator.printSync(
                      "ACTS_DO_ABILITY_FOREGROUND_CALLBACK_ERROR_0003 Main4Ability : " +
                        ability2.context.abilityInfo.name
                    );
                    var stateNum = abilityDelegator.getAbilityState(ability1);
                    abilityDelegator.printSync(
                      "ACTS_DO_ABILITY_FOREGROUND_CALLBACK_ERROR_0003 getAbilityState: " +
                        stateNum
                    );
                    expect(stateNum).assertEqual(3);
                    expect(ability2.context.abilityInfo.name).assertEqual(
                      "Main4Ability"
                    );
                    abilityDelegator.printSync(
                      "ACTS_DO_ABILITY_FOREGROUND_CALLBACK_ERROR_0003 pass."
                    );
                    done();
                  }
                );
              }
            }, START_ABILITY_TIMEOUT_TWO_THOUSAND);
          });
        });
      }
    );

    /**
     * @tc.number ACTS_DO_ABILITY_FOREGROUND_CALLBACK_0004
     * @tc.name actsDoAbilityForegroundCallback0004
     * @tc.desc Test the api: doAbilityForeground, swith the ability which is foregrond to foreground.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */

    it("ACTS_DO_ABILITY_FOREGROUND_CALLBACK_0004", 0, async function (done) {
      let wantMain2 = {
        abilityName: "Main4Ability",
        bundleName: "com.example.delegatortest",
        moduleName: "entry",
      };

      let wantMain = {
        abilityName: "Main3Ability",
        bundleName: "com.example.delegatortest",
        moduleName: "entry",
      };
      abilityDelegator.printSync(
        "ACTS_DO_ABILITY_FOREGROUND_CALLBACK_0004 start"
      );
      abilityDelegator.startAbility(wantMain2, () => {
        setTimeout(() => {
          abilityDelegator.getCurrentTopAbility((err: any, ability1: any) => {
            abilityDelegator.printSync(
              "ACTS_DO_ABILITY_FOREGROUND_CALLBACK_0004 Main4Ability: " +
                ability1.context.abilityInfo.name
            );
            abilityDelegator.startAbility(wantMain, () => {
              setTimeout(() => {
                abilityDelegator.getCurrentTopAbility(
                  (err: any, ability2: any) => {
                    abilityDelegator.printSync(
                      "ACTS_DO_ABILITY_FOREGROUND_CALLBACK_0004 Main3Ability: " +
                        ability2.context.abilityInfo.name
                    );
                    abilityDelegator.doAbilityForeground(
                      ability2,
                      (err: any) => {
                        setTimeout(() => {
                          abilityDelegator.getCurrentTopAbility(
                            (err: any, ability3: any) => {
                              try {
                                abilityDelegator.printSync(
                                  "ACTS_DO_ABILITY_FOREGROUND_CALLBACK_0004 Main3Ability: " +
                                    ability3.context.abilityInfo.name
                                );
                                var stateNum =
                                  abilityDelegator.getAbilityState(ability3);
                                abilityDelegator.printSync(
                                  "ACTS_DO_ABILITY_FOREGROUND_CALLBACK_0004 getAbilityState stateNum :" +
                                    stateNum
                                );
                                expect(
                                  ability3.context.abilityInfo.name
                                ).assertEqual("Main3Ability");
                                expect(stateNum).assertEqual(2);
                                abilityDelegator.printSync(
                                  "ACTS_DO_ABILITY_FOREGROUND_CALLBACK_0004 pass"
                                );
                              } catch {
                                abilityDelegator.printSync(
                                  "ACTS_DO_ABILITY_FOREGROUND_CALLBACK_0004 fail"
                                );
                              }
                              done();
                            }
                          );
                        }, START_ABILITY_TIMEOUT_TWO_THOUSAND);
                      }
                    );
                  }
                );
              }, START_ABILITY_TIMEOUT_TWO_THOUSAND);
            });
          });
        }, START_ABILITY_TIMEOUT_TWO_THOUSAND);
      });
    });

    /**
     * @tc.number ACTS_DO_ABILITY_FOREGROUND_CALLBACK_ERROR_0005
     * @tc.name actsDoAbilityForegroundCallbackError0005
     * @tc.desc Test the api: doAbilityForeground, swith the wrong ability forground.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      "ACTS_DO_ABILITY_FOREGROUND_CALLBACK_ERROR_0005",
      0,
      async function (done) {
        let wantMain = {
          abilityName: "Main3Ability",
          bundleName: "com.example.delegatortest",
          moduleName: "entry",
        };
        abilityDelegator.printSync(
          "ACTS_DO_ABILITY_FOREGROUND_CALLBACK_ERROR_0005 start"
        );
        abilityDelegator.getCurrentTopAbility((err: any, ability1: any) => {
          abilityDelegator.printSync(
            "ACTS_DO_ABILITY_FOREGROUND_CALLBACK_ERROR_0005 Main4Ability: " +
              ability1.context.abilityInfo.name
          );
          abilityDelegator.startAbility(wantMain, () => {
            abilityDelegator.printSync(
              "ACTS_DO_ABILITY_FOREGROUND_CALLBACK_ERROR_0005 startAbility"
            );
            setTimeout(() => {
              abilityDelegator.getCurrentTopAbility(
                (err: any, ability2: any) => {
                  ability2.context.terminateSelf(() => {
                    setTimeout(() => {
                      try {
                        abilityDelegator.doAbilityForeground(
                          ability2,
                          (err: any) => {}
                        );
                      } catch (error) {
                        expect(error.message).assertEqual(
                          "Incorrect parameters."
                        );
                        abilityDelegator.printSync(
                          "ACTS_DO_ABILITY_FOREGROUND_CALLBACK_ERROR_0005 doAbilityForeground meet an error: " +
                            error
                        );
                      }
                      done();
                    }, START_ABILITY_TIMEOUT_TWO_THOUSAND);
                  });
                }
              );
            }, START_ABILITY_TIMEOUT_TWO_THOUSAND);
          });
        });
      }
    );
  });
}
