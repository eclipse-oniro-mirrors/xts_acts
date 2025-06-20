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
 * WITHOUT WARRANTIES OR CONDITIONS OF UIAbility KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import AbilityDelegatorRegistry from "@ohos.app.ability.abilityDelegatorRegistry";
import { BusinessError } from '@ohos.base';
import UIAbility from '@ohos.app.ability.UIAbility';
import systemParameterEnhance from '@ohos.systemParameterEnhance';

let abilityDelegator: AbilityDelegatorRegistry.AbilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
let deviceSupport = systemParameterEnhance.getSync('persist.sys.abilityms.move_ui_ability_to_background_api_enable');
const START_ABILITY_TIMEOUT_TWO_THOUSAND = 2000;
const START_ABILITY_TIMEOUT_THOUSAND = 1000;

export default function ForegroundPromise() {
  describe("ForegroundPromise", () => {
    beforeEach((done: Function) => {
      abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      abilityDelegator.startAbility({
        abilityName: "MainAbility",
        bundleName: "com.example.crossplatformpromise",
        moduleName: "entry_test",
      });
      setTimeout(() => {
        done();
      }, START_ABILITY_TIMEOUT_TWO_THOUSAND);
    });


    /**
     * @tc.number ACTS_DO_ABILITY_FOREGROUND_PROMISE_0001
     * @tc.name actsDoAbilityForegroundPromise0001
     * @tc.desc Test the api: doAbilityForeground, swith the ability forground.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("ACTS_DO_ABILITY_FOREGROUND_PROMISE_0001", Level.LEVEL0, async (done: Function) => {

      setTimeout(() => {
        abilityDelegator.printSync(
          "ACTS_DO_ABILITY_FOREGROUND_PROMISE_0001 start"
        );
        if (deviceSupport === 'false') {
          done();
          return;
        }
        abilityDelegator.startAbility({
          abilityName: "Main4Ability",
          bundleName: "com.example.crossplatformpromise",
          moduleName: "entry_test",
        }, () => {
          setTimeout(() => {
            abilityDelegator.getCurrentTopAbility((err:BusinessError, ability1: UIAbility) => {
              abilityDelegator.printSync(
                "ACTS_DO_ABILITY_FOREGROUND_PROMISE_0001 Main4Ability: " +
                ability1.context.abilityInfo.name
              );
              abilityDelegator.startAbility({
                abilityName: "Main3Ability",
                bundleName: "com.example.crossplatformpromise",
                moduleName: "entry_test",
              }, () => {
                setTimeout(() => {
                  abilityDelegator.getCurrentTopAbility(
                    (err:BusinessError, ability2: UIAbility) => {
                      abilityDelegator.printSync(
                        "ACTS_DO_ABILITY_FOREGROUND_PROMISE_0001 Main3Ability: " +
                        ability2.context.abilityInfo.name
                      );
                      abilityDelegator
                        .doAbilityForeground(ability1)
                        .then(() => {
                          setTimeout(() => {
                            abilityDelegator.getCurrentTopAbility(
                              (err:BusinessError, ability3: UIAbility) => {
                                try {
                                  abilityDelegator.printSync(
                                    "ACTS_DO_ABILITY_FOREGROUND_PROMISE_0001 Main4Ability: " +
                                    ability3.context.abilityInfo.name
                                  );
                                  let stateNum =
                                    abilityDelegator.getAbilityState(ability3);
                                  abilityDelegator.printSync(
                                    "ACTS_DO_ABILITY_FOREGROUND_PROMISE_0001 getAbilityState stateNum :" +
                                      stateNum
                                  );
                                  expect(stateNum).assertEqual(2);
                                  abilityDelegator.printSync(
                                    "ACTS_DO_ABILITY_FOREGROUND_PROMISE_0001 pass"
                                  );
                                } catch (error) {
                                  abilityDelegator.printSync(
                                    "ACTS_DO_ABILITY_FOREGROUND_PROMISE_0001 error:" +
                                      error
                                  );
                                }
                                done();
                              }
                            );
                          }, START_ABILITY_TIMEOUT_TWO_THOUSAND);
                        })
                        .catch((error:BusinessError) => {
                          abilityDelegator.printSync(
                            "ACTS_DO_ABILITY_FOREGROUND_PROMISE_0001 catch error: " +
                              error
                          );
                        });
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
     * @tc.number ACTS_DO_ABILITY_FOREGROUND_PROMISE_ERROR_0002
     * @tc.name actsDoAbilityForegroundPromiseError0002
     * @tc.desc Test the api: doAbilityForeground, swith the ability forground.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      "ACTS_DO_ABILITY_FOREGROUND_PROMISE_ERROR_0002",
      0,
      async (done: Function) => {
        abilityDelegator.printSync(
          "ACTS_DO_ABILITY_FOREGROUND_PROMISE_ERROR_0002 start"
        );
        if (deviceSupport === 'false') {
          done();
          return;
        }
        abilityDelegator.getCurrentTopAbility((err:BusinessError, ability1: UIAbility) => {
          abilityDelegator.printSync(
            "ACTS_DO_ABILITY_FOREGROUND_PROMISE_ERROR_0002 Main4Ability: " +
            ability1.context.abilityInfo.name
          );
          abilityDelegator.startAbility({
            abilityName: "Main3Ability",
            bundleName: "com.example.crossplatformpromise",
            moduleName: "entry_test",
          }, () => {
            abilityDelegator.printSync(
              "ACTS_DO_ABILITY_FOREGROUND_PROMISE_ERROR_0002 startAbility"
            );
            setTimeout(() => {
              try {
                abilityDelegator
                  .doAbilityForeground(undefined)
                  .then(() => {
                    abilityDelegator.printSync(
                      "ACTS_DO_ABILITY_FOREGROUND_PROMISE_ERROR_0002 fail"
                    );
                    expect().assertFail();
                    done();
                  })
                  .catch((error:BusinessError) => {
                    abilityDelegator.printSync(
                      "ACTS_DO_ABILITY_FOREGROUND_PROMISE_ERROR_0002 catch error: " +
                        error
                    );
                  });
              } catch {
                abilityDelegator.printSync(
                  "ACTS_DO_ABILITY_FOREGROUND_PROMISE_ERROR_0002 doAbilityForeground meet an error: ability is wrong"
                );
                abilityDelegator.getCurrentTopAbility(
                  (err:BusinessError, ability2: UIAbility) => {
                    abilityDelegator.printSync(
                      "ACTS_DO_ABILITY_FOREGROUND_PROMISE_ERROR_0002 Main3Ability : " +
                      ability2.context.abilityInfo.name
                    );
                    let stateNum = abilityDelegator.getAbilityState(ability1);
                    abilityDelegator.printSync(
                      "ACTS_DO_ABILITY_FOREGROUND_PROMISE_ERROR_0002 getAbilityState: " +
                        stateNum
                    );
                    expect(stateNum).assertEqual(3);
                    expect(ability2.context.abilityInfo.name).assertEqual(
                      "Main3Ability"
                    );
                    abilityDelegator.printSync(
                      "ACTS_DO_ABILITY_FOREGROUND_PROMISE_ERROR_0002 pass."
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
     * @tc.number ACTS_DO_ABILITY_FOREGROUND_PROMISE_ERROR_0003
     * @tc.name actsDoAbilityForegroundPromiseError0003
     * @tc.desc Test the api: doAbilityForeground, swith the ability forground.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
   /* it(
      "ACTS_DO_ABILITY_FOREGROUND_PROMISE_ERROR_0003",
      0,
      async (done: Function) => {
        abilityDelegator.printSync(
          "ACTS_DO_ABILITY_FOREGROUND_PROMISE_ERROR_0003 start"
        );
        if (deviceSupport === 'false') {
          done();
          return;
        }
        abilityDelegator.getCurrentTopAbility((err:BusinessError, ability1: UIAbility) => {
          abilityDelegator.printSync(
            "ACTS_DO_ABILITY_FOREGROUND_PROMISE_ERROR_0003 Main3Ability: " +
            ability1.context.abilityInfo.name
          );
          abilityDelegator.startAbility({
            abilityName: "Main4Ability",
            bundleName: "com.example.crossplatformpromise",
            moduleName: "entry_test",
          }, () => {
            abilityDelegator.printSync(
              "ACTS_DO_ABILITY_FOREGROUND_PROMISE_ERROR_0003 startAbility"
            );
            setTimeout(() => {
              try {
                abilityDelegator
                  .doAbilityForeground("")
                  .then(() => {
                    abilityDelegator.printSync(
                      "ACTS_DO_ABILITY_FOREGROUND_PROMISE_ERROR_0003 fail"
                    );
                    expect().assertFail();
                    done();
                  })
                  .catch((error:BusinessError) => {
                    abilityDelegator.printSync(
                      "ACTS_DO_ABILITY_FOREGROUND_PROMISE_ERROR_0003 catch error: " +
                        error
                    );
                  });
              } catch {
                abilityDelegator.printSync(
                  "ACTS_DO_ABILITY_FOREGROUND_PROMISE_ERROR_0003 doAbilityForeground meet an error: ability is null"
                );
                abilityDelegator.getCurrentTopAbility(
                  (err:BusinessError, ability2: UIAbility) => {
                    abilityDelegator.printSync(
                      "ACTS_DO_ABILITY_FOREGROUND_PROMISE_ERROR_0003 Main4Ability : " +
                      ability2.context.abilityInfo.name
                    );
                    let stateNum = abilityDelegator.getAbilityState(ability1);
                    abilityDelegator.printSync(
                      "ACTS_DO_ABILITY_FOREGROUND_PROMISE_ERROR_0003 getAbilityState: " +
                        stateNum
                    );
                    expect(stateNum).assertEqual(3);
                    expect(ability2.context.abilityInfo.name).assertEqual(
                      "Main4Ability"
                    );
                    abilityDelegator.printSync(
                      "ACTS_DO_ABILITY_FOREGROUND_PROMISE_ERROR_0003 pass."
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
    */
    /**
     * @tc.number ACTS_DO_ABILITY_FOREGROUND_PROMISE_0004
     * @tc.name actsDoAbilityForegroundPromise004
     * @tc.desc Test the api: doAbilityForeground, swith the ability forground.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("ACTS_DO_ABILITY_FOREGROUND_PROMISE_0004", Level.LEVEL0, async (done: Function) => {

      abilityDelegator.printSync(
        "ACTS_DO_ABILITY_FOREGROUND_PROMISE_0004 start"
      );
      if (deviceSupport === 'false') {
        done();
        return;
      }
      abilityDelegator.startAbility({
        abilityName: "Main4Ability",
        bundleName: "com.example.crossplatformpromise",
        moduleName: "entry_test",
      }, () => {
        setTimeout(() => {
          abilityDelegator.getCurrentTopAbility((err:BusinessError, ability1: UIAbility) => {
            abilityDelegator.printSync(
              "ACTS_DO_ABILITY_FOREGROUND_PROMISE_0004 Main4Ability: " +
              ability1.context.abilityInfo.name
            );
            abilityDelegator.startAbility({
              abilityName: "Main3Ability",
              bundleName: "com.example.crossplatformpromise",
              moduleName: "entry_test",
            }, () => {
              setTimeout(() => {
                abilityDelegator.getCurrentTopAbility(
                  (err:BusinessError, ability2: UIAbility) => {
                    abilityDelegator.printSync(
                      "ACTS_DO_ABILITY_FOREGROUND_PROMISE_0004 Main3Ability: " +
                      ability2.context.abilityInfo.name
                    );
                    abilityDelegator
                      .doAbilityForeground(ability2)
                      .then(() => {
                        setTimeout(() => {
                          abilityDelegator.getCurrentTopAbility(
                            (err:BusinessError, ability3: UIAbility) => {
                              try {
                                abilityDelegator.printSync(
                                  "ACTS_DO_ABILITY_FOREGROUND_PROMISE_0004 Main3Ability: " +
                                  ability3.context.abilityInfo.name
                                );
                                let stateNum =
                                  abilityDelegator.getAbilityState(ability3);
                                abilityDelegator.printSync(
                                  "ACTS_DO_ABILITY_FOREGROUND_PROMISE_0004 getAbilityState stateNum :" +
                                    stateNum
                                );
                                expect(
                                  ability3.context.abilityInfo.name
                                ).assertEqual("Main3Ability");
                                expect(stateNum).assertEqual(2);
                                abilityDelegator.printSync(
                                  "ACTS_DO_ABILITY_FOREGROUND_PROMISE_0004 pass"
                                );
                              } catch {
                                abilityDelegator.printSync(
                                  "ACTS_DO_ABILITY_FOREGROUND_PROMISE_0004 fail"
                                );
                              }
                              done();
                            }
                          );
                        }, START_ABILITY_TIMEOUT_TWO_THOUSAND);
                      })
                      .catch((error:BusinessError) => {
                        abilityDelegator.printSync(
                          "ACTS_DO_ABILITY_FOREGROUND_PROMISE_ERROR_0003 catch error: " +
                            error
                        );
                      });
                  }
                );
              }, START_ABILITY_TIMEOUT_TWO_THOUSAND);
            });
          });
        }, START_ABILITY_TIMEOUT_TWO_THOUSAND);
      });
    });

    /**
     * @tc.number ACTS_DO_ABILITY_FOREGROUND_PROMISE_ERROR_0005
     * @tc.name actsDoAbilityForegroundPromiseError0005
     * @tc.desc Test the api: doAbilityForeground, swith the ability forground.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it(
      "ACTS_DO_ABILITY_FOREGROUND_PROMISE_ERROR_0005",
      0,
      async (done: Function) => {
        abilityDelegator.printSync(
          "ACTS_DO_ABILITY_FOREGROUND_PROMISE_ERROR_0005 start"
        );
        if (deviceSupport === 'false') {
          done();
          return;
        }
        abilityDelegator.getCurrentTopAbility((err:BusinessError, ability1: UIAbility) => {
          abilityDelegator.printSync(
            "ACTS_DO_ABILITY_FOREGROUND_PROMISE_ERROR_0005 Main4Ability: " +
            ability1.context.abilityInfo.name
          );
          abilityDelegator.startAbility({
            abilityName: "Main3Ability",
            bundleName: "com.example.crossplatformpromise",
            moduleName: "entry_test",
          }, () => {
            abilityDelegator.printSync(
              "ACTS_DO_ABILITY_FOREGROUND_PROMISE_ERROR_0005 startAbility"
            );
            setTimeout(() => {
              abilityDelegator.getCurrentTopAbility(
                (err:BusinessError, ability2: UIAbility) => {
                  ability2.context.terminateSelf(() => {
                    setTimeout(() => {
                      try {
                        abilityDelegator
                          .doAbilityForeground(ability2)
                          .then(() => {
                          });
                      } catch (error) {
                        expect(error.message).assertContain(
                          "Parse"
                        );
                        abilityDelegator.printSync(
                          "ACTS_DO_ABILITY_FOREGROUND_PROMISE_ERROR_0005 doAbilityBackground meet an error: " +
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
