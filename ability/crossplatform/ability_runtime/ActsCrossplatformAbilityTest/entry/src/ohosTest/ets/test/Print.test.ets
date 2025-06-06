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
// // @ts-nocheck
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from '@ohos/hypium';
import AbilityDelegatorRegistry from "@ohos.app.ability.abilityDelegatorRegistry";
import { BusinessError } from '@ohos.base';

let abilityDelegator: AbilityDelegatorRegistry.AbilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();

export default function PrintTest() {
  describe("PrintTest", () => {
    /**
     * @tc.number ACTS_PRINT_CALLBACK_0001
     * @tc.name actsPrintCallback0001
     * @tc.desc Test the api "abilityDelegator.print", return the result with callback function.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("ACTS_PRINT_CALLBACK_0001", Level.LEVEL0, async (done: Function) => {
      console.log("ACTS_PRINT_CALLBACK_0001 :start");
      let msg = "print_Callback normal message: hello print callback.";
      abilityDelegator.print(msg, (err: BusinessError) => {
        abilityDelegator.printSync(
          "ACTS_PRINT_CALLBACK_0001 print callback err" + err
        );
        done();
      });
    });

    /**
     * @tc.number ACTS_PRINT_CALLBACK_0003
     * @tc.name actsPrintCallback0003
     * @tc.desc Test the api "abilityDelegator.print", return the result with callback function.
     *               The print information includes escape character.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("ACTS_PRINT_CALLBACK_0003", Level.LEVEL0, async (done: Function) => {
      console.log("ACTS_PRINT_CALLBACK_0003 :start");
      let msg = "print_Callback escape character: \n";

      abilityDelegator.print(msg, (err: BusinessError) => {
        abilityDelegator.printSync("ACTS_PRINT_CALLBACK_0003 print callback");
        done();
      });
    });

    /**
     * @tc.number ACTS_PRINT_CALLBACK_0004
     * @tc.name actsPrintCallback0004
     * @tc.desc Test the api "abilityDelegator.print", return the result with callback function.
     *               The print information includes special characters, etc.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("ACTS_PRINT_CALLBACK_0004", Level.LEVEL0, async (done: Function) => {
      console.log("ACTS_PRINT_CALLBACK_0004 :start");
      let msg: string = "print_Callback special character: © ® ℃ ℉ ™ ↵";

      abilityDelegator.print(msg, (err: BusinessError) => {
        abilityDelegator.printSync("ACTS_PRINT_CALLBACK_0004 print callback");
        done();
      });
    });

    /**
     * @tc.number ACTS_PRINT_CALLBACK_0005
     * @tc.name actsPrintCallback0005
     * @tc.desc Test the api "abilityDelegator.print", return the result with callback function.
     *               The print information includes Chinese etc.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("ACTS_PRINT_CALLBACK_0005", Level.LEVEL0, async (done: Function) => {
      console.log("ACTS_PRINT_CALLBACK_0005 :start");
      let msg: string = "print_Callback language: 中文 English  Русский язык Français";

      abilityDelegator.print(msg, (err: BusinessError) => {
        abilityDelegator.printSync("ACTS_PRINT_CALLBACK_0005 print callback");
        done();
      });
    });

    /**
     * @tc.number ACTS_PRINT_CALLBACK_0006
     * @tc.name actsPrintCallback0006
     * @tc.desc Test the api "abilityDelegator.print", return the result with callback function.
     *               the length of the printSync message is greater than 1000 characters.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("ACTS_PRINT_CALLBACK_0006", Level.LEVEL0, async (done: Function) => {
      console.log("ACTS_PRINT_CALLBACK_0006 :start");
      let msg: string =
        "0callbackaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" +
          "aaaaaaaaaa" +
          "1aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" +
          "2aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" +
          "3aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" +
          "4aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" +
          "5aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" +
          "6aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" +
          "7aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" +
          "8aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" +
          "9aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaae" +
          "fffffffffff";
      abilityDelegator.print(msg, (err: BusinessError) => {
        abilityDelegator.printSync(
          "ACTS_PRINT_CALLBACK_0006 print callback err" + JSON.stringify(err)
        );
        abilityDelegator.printSync("ACTS_PRINT_CALLBACK_0006 print callback");
        done();
      });
    });

    /**
     * @tc.number ACTS_PRINT_PROMISE_0001
     * @tc.name actsPrintPromise0001
     * @tc.desc Test the api "abilityDelegator.print", return the result with promise function.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("ACTS_PRINT_PROMISE_0001", Level.LEVEL0, async (done: Function) => {
      console.log("ACTS_PRINT_PROMISE_0001 :start");
      let msg = "print_Promise normal message: hello print promise.";
      abilityDelegator
        .print(msg)
        .then(() => {
          abilityDelegator.printSync("ACTS_PRINT_PROMISE_0001 print promise");
          done();
        })
        .catch((error: BusinessError) => {
          abilityDelegator.printSync(
            "ACTS_PRINT_PROMISE_0001 catch error: " + error
          );
          expect().assertFail();
          done();
        });
    });

    /**
     * @tc.number ACTS_PRINT_PROMISE_0003
     * @tc.name actsPrintPromise0003
     * @tc.desc Test the api "abilityDelegator.print", return the result with promise function.
     *               The print information includes escape character.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("ACTS_PRINT_PROMISE_0003", Level.LEVEL0, async (done: Function) => {
      console.log("ACTS_PRINT_PROMISE_0003 :start");
      let msg = "print_Promise escape character: \n";
      abilityDelegator
        .print(msg)
        .then(() => {
          abilityDelegator.printSync("ACTS_PRINT_PROMISE_0003 print promise");
          done();
        })
        .catch((error: BusinessError) => {
          abilityDelegator.printSync(
            "ACTS_PRINT_PROMISE_0003 catch error: " + error
          );
          expect().assertFail();
          done();
        });
    });

    /**
     * @tc.number ACTS_PRINT_PROMISE_0004
     * @tc.name actsPrintPromise0004
     * @tc.desc Test the api "abilityDelegator.print", return the result with promise function.
     *               The print information includes special characters, etc.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("ACTS_PRINT_PROMISE_0004", Level.LEVEL0, async (done: Function) => {
      console.log("ACTS_PRINT_PROMISE_0004 :start");
      let msg = "print_Promise special character: © ® ℃ ℉ ™ ↵";
      abilityDelegator
        .print(msg)
        .then(() => {
          abilityDelegator.printSync("ACTS_PRINT_PROMISE_0004 print promise");
          done();
        })
        .catch((error: BusinessError) => {
          abilityDelegator.printSync(
            "ACTS_PRINT_PROMISE_0004 catch error: " + error
          );
          expect().assertFail();
          done();
        });
    });

    /**
     * @tc.number ACTS_PRINT_PROMISE_0005
     * @tc.name actsPrintPromise0005
     * @tc.desc Test the api "abilityDelegator.print", return the result with promise function.
     *               The print information includes Chinese etc.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("ACTS_PRINT_PROMISE_0005", Level.LEVEL0, async (done: Function) => {
      console.log("ACTS_PRINT_PROMISE_0005 :start");
      let msg = "print_Promise language: 中文 English  Русский язык Français";
      abilityDelegator
        .print(msg)
        .then(() => {
          abilityDelegator.printSync("ACTS_PRINT_PROMISE_0005 print promise");
          done();
        })
        .catch((error: BusinessError) => {
          abilityDelegator.printSync(
            "ACTS_PRINT_PROMISE_0005 catch error: " + error
          );
          expect().assertFail();
          done();
        });
    });

    /**
     * @tc.number ACTS_PRINT_PROMISE_0006
     * @tc.name actsPrintPromise0006
     * @tc.desc Test the api "abilityDelegator.print", return the result with promise function.
     *               the length of the printSync message is greater than 1000 characters.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("ACTS_PRINT_PROMISE_0006", Level.LEVEL0, async (done: Function) => {
      console.log("ACTS_PRINT_PROMISE_0006 :start");
      let msg: string =
        "0callbackaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" +
          "aaaaaaaaaa" +
          "1aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" +
          "2aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" +
          "3aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" +
          "4aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" +
          "5aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" +
          "6aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" +
          "7aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" +
          "8aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" +
          "9aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaae" +
          "fffffffffff";
      abilityDelegator
        .print(msg)
        .then(() => {
          abilityDelegator.printSync("ACTS_PRINT_PROMISE_0006 print promise");
          done();
        })
        .catch((error: BusinessError) => {
          abilityDelegator.printSync("ACTS_PRINT_PROMISE_0006 error:" + error);
          expect().assertFail();
          done();
        });
    });

    /**
     * @tc.number ACTS_PRINT_SYNC_0001
     * @tc.name actsPrintSync0001
     * @tc.desc Test the api "abilityDelegator.printSync", return the result.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("ACTS_PRINT_SYNC_0001", Level.LEVEL0, async (done: Function) => {
      console.log("ACTS_PRINT_SYNC_0001 :start");
      let abilityDelegator: AbilityDelegatorRegistry.AbilityDelegator;
      let msg = "printSync msg";
      abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      abilityDelegator.printSync(msg);
      abilityDelegator.printSync("ACTS_PRINTSYNC_0001 printSync");
      done();
    });

    /**
     * @tc.number ACTS_PRINT_SYNC_0003
     * @tc.name actsPrintSync0003
     * @tc.desc Test the api "abilityDelegator.print", return the result.
     *               The printSync information includes escape character.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("ACTS_PRINT_SYNC_0003", Level.LEVEL0, async (done: Function) => {
      console.log("ACTS_PRINT_SYNC_0003 :start");
      let msg: string = "printSync escape character: \n";
      abilityDelegator.printSync(msg);
      abilityDelegator.printSync("ACTS_PRINT_SYNC_0003 printSync");
      done();
    });

    /**
     * @tc.number ACTS_PRINT_SYNC_0004
     * @tc.name actsPrintSync0004
     * @tc.desc Test the api "abilityDelegator.print", return the result.
     *               The printSync information includes special characters, etc.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("ACTS_PRINT_SYNC_0004", Level.LEVEL0, async (done: Function) => {
      console.log("ACTS_PRINT_SYNC_0004 :start");
      let msg: string = "printSync special character: © ® ℃ ℉ ™ ↵";
      abilityDelegator.printSync(msg);
      abilityDelegator.printSync("ACTS_PRINT_SYNC_0004 printSync");
      done();
    });

    /**
     * @tc.number ACTS_PRINT_SYNC_0005
     * @tc.name actsPrintSync0005
     * @tc.desc Test the api "abilityDelegator.print", return the result.
     *               The printSync information includes Chinese etc.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("ACTS_PRINT_SYNC_0005", Level.LEVEL0, async (done: Function) => {
      console.log("ACTS_PRINT_SYNC_0005 :start");
      let msg: string = "printSync language: 中文 English  Русский язык Français";
      abilityDelegator.printSync(msg);
      abilityDelegator.printSync("ACTS_PRINT_SYNC_0005 printSync");
      done();
    });

    /**
     * @tc.number ACTS_PRINT_SYNC_0006
     * @tc.name actsPrintSync0006
     * @tc.desc Test the api "abilityDelegator.print", return the result.
     *               the length of the printSync message is greater than 1000 characters.
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it("ACTS_PRINT_SYNC_0006", Level.LEVEL0, async (done: Function) => {
      console.log("ACTS_PRINT_SYNC_0006 :start");
      let msg: string =
        "0callbackaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" +
          "aaaaaaaaaa" +
          "1aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" +
          "2aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" +
          "3aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" +
          "4aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" +
          "5aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" +
          "6aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" +
          "7aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" +
          "8aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa" +
          "9aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaae" +
          "fffffffffff";
      abilityDelegator.printSync(msg);
      abilityDelegator.printSync("ACTS_PRINT_SYNC_0006 printSync");
      done();
    });
  });
}
