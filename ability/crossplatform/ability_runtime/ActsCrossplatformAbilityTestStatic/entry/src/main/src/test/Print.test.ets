/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import { describe, it, expect, TestType, Size, Level, afterEach, beforeAll, afterEach, beforeEach } from "../../../hypium/index";
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import { Driver, ON } from '@ohos.UiTest';

let abilityDelegator: AbilityDelegatorRegistry.AbilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();

export default function PrintTest() {
  describe("PrintTest", () => {
    beforeAll(async () => {
      let driver = Driver.create();	
      try {
        let allowed = await driver.findComponent(ON.id('advanced_dialog_button_0'));
        if (allowed) {
          await allowed.click();
        }
      } catch (err) {
        console.error('findComponent failed: ' + JSON.stringify(err));
      }
    })
    
    /**
     * @tc.name   ACTS_PRINT_SYNC_0001
     * @tc.number ACTS_PRINT_SYNC_0001
     * @tc.desc   Test the api "abilityDelegator.printSync", return the result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ACTS_PRINT_SYNC_0001", Level.LEVEL0, async (done: () => void): Promise<void> =>{
      console.log("ACTS_PRINT_SYNC_0001 :start");
      let abilityDelegator: AbilityDelegatorRegistry.AbilityDelegator;
      let msg = "printSync msg";
      abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
      abilityDelegator.printSync(msg);
      abilityDelegator.printSync("ACTS_PRINTSYNC_0001 printSync");
      expect(true).assertTrue();
      done();
    });

    /**
     * @tc.name   ACTS_PRINT_SYNC_0003
     * @tc.number ACTS_PRINT_SYNC_0003
     * @tc.desc   Test the api "abilityDelegator.print", return the result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ACTS_PRINT_SYNC_0003", Level.LEVEL0, async (done: () => void): Promise<void> =>{
      console.log("ACTS_PRINT_SYNC_0003 :start");
      let msg: string = "printSync escape character: \n";
      abilityDelegator.printSync(msg);
      abilityDelegator.printSync("ACTS_PRINT_SYNC_0003 printSync");
      expect(true).assertTrue();
      done();
    });

    /**
     * @tc.name   ACTS_PRINT_SYNC_0004
     * @tc.number ACTS_PRINT_SYNC_0004
     * @tc.desc   Test the api "abilityDelegator.print", return the result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ACTS_PRINT_SYNC_0004", Level.LEVEL0, async (done: () => void): Promise<void> =>{
      console.log("ACTS_PRINT_SYNC_0004 :start");
      let msg: string = "printSync special character: © ® ℃ ℉ ™ ↵";
      abilityDelegator.printSync(msg);
      abilityDelegator.printSync("ACTS_PRINT_SYNC_0004 printSync");
      expect(true).assertTrue();
      done();
    });

    /**
     * @tc.name   ACTS_PRINT_SYNC_0005
     * @tc.number ACTS_PRINT_SYNC_0005
     * @tc.desc   Test the api "abilityDelegator.print", return the result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ACTS_PRINT_SYNC_0005", Level.LEVEL0, async (done: () => void): Promise<void> =>{
      console.log("ACTS_PRINT_SYNC_0005 :start");
      let msg: string = "printSync language: 中文 English  Русский язык Français";
      abilityDelegator.printSync(msg);
      abilityDelegator.printSync("ACTS_PRINT_SYNC_0005 printSync");
      expect(true).assertTrue();
      done();
    });

    /**
     * @tc.name   ACTS_PRINT_SYNC_0006
     * @tc.number ACTS_PRINT_SYNC_0006
     * @tc.desc   Test the api "abilityDelegator.print", return the result.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("ACTS_PRINT_SYNC_0006", Level.LEVEL0, async (done: () => void): Promise<void> =>{
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
      expect(true).assertTrue();
      done();
    });
  });
}
