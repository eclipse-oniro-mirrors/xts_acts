/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { beforeAll, beforeEach, describe, it , TestType, Size, Level } from '@ohos/hypium';
import router from '@ohos.router';
import Utils from './Utils';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';

const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

const EVENT_ID_SET_SUITE_KEY = 180101;
let driver = Driver.create();
let emitKey = ""
let tcName = ""

export default function WebkeyboardAvoidMode() {

  describe('WebkeyboardAvoidMode', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/WebkeyboardAvoidMode',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get WebkeyboardAvoidMode state success " + JSON.stringify(pages));
        if (!("WebkeyboardAvoidMode" == pages.name)) {
          console.info("get WebkeyboardAvoidMode state success " + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await driver.waitForComponent(ON.id("keyboardAvoidMode"), 10000);
          console.info("push WebkeyboardAvoidMode page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push WebkeyboardAvoidMode page error: " + err);
      }
      done()
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info(`enable success`);
        }).catch((err: object) => {
        console.error(`failed to enable, ${err}`);
      })
      console.info("web beforeEach start");
      done();
    })

    /*
    * @tc.number     : SUB_WEB_KEYBOARDAVOIDMODE_0100
    * @tc.name       : testKeyboardAvoidMode0100
    * @tc.desc       : test KeyboardAvoidMode
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('emitKeyboardAvoidMode0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'emitKeyboardAvoidMode0100';
      tcName = 'testKeyboardAvoidMode0100'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, 'true', 180110, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "keyboardAvoidMode", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /*
    * @tc.number     : SUB_WEB_KEYBOARDAVOIDMODE_0200
    * @tc.name       : testKeyboardAvoidMode0200
    * @tc.desc       : test KeyboardAvoidMode
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('emitKeyboardAvoidMode0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'emitKeyboardAvoidMode0200';
      tcName = 'testKeyboardAvoidMode0200'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, 'true', 180120, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "keyboardAvoidMode", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /*
    * @tc.number     : SUB_WEB_KEYBOARDAVOIDMODE_0300
    * @tc.name       : testKeyboardAvoidMode0300
    * @tc.desc       : test KeyboardAvoidMode
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('emitKeyboardAvoidMode0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'emitKeyboardAvoidMode0300';
      tcName = 'testKeyboardAvoidMode0300'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, 'true', 180130, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "keyboardAvoidMode", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /*
    * @tc.number     : SUB_WEB_KEYBOARDAVOIDMODE_0400
    * @tc.name       : testKeyboardAvoidMode0400
    * @tc.desc       : test KeyboardAvoidMode
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('emitKeyboardAvoidMode0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'emitKeyboardAvoidMode0400';
      tcName = 'testKeyboardAvoidMode0400'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, 'true', 180140, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "keyboardAvoidMode", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /*
    * @tc.number     : SUB_WEB_KEYBOARDAVOIDMODE_0500
    * @tc.name       : testKeyboardAvoidMode0500
    * @tc.desc       : test KeyboardAvoidMode
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('emitKeyboardAvoidMode0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'emitKeyboardAvoidMode0500';
      tcName = 'testKeyboardAvoidMode0500'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, 'true', 180150, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "keyboardAvoidMode", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /*
    * @tc.number     : SUB_WEB_KEYBOARDAVOIDMODE_0600
    * @tc.name       : testKeyboardAvoidMode0600
    * @tc.desc       : test KeyboardAvoidMode
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('emitKeyboardAvoidMode0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'emitKeyboardAvoidMode0600';
      tcName = 'testKeyboardAvoidMode0600'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, 'true', 180160, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "keyboardAvoidMode", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /*
    * @tc.number     : SUB_WEB_KEYBOARDAVOIDMODE_0700
    * @tc.name       : testKeyboardAvoidMode0700
    * @tc.desc       : test KeyboardAvoidMode
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('emitKeyboardAvoidMode0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'emitKeyboardAvoidMode0700';
      tcName = 'testKeyboardAvoidMode0700'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, 'false', 180170, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "keyboardAvoidMode", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /*
    * @tc.number     : SUB_WEB_KEYBOARDAVOIDMODE_0800
    * @tc.name       : testKeyboardAvoidMode0800
    * @tc.desc       : test KeyboardAvoidMode
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('emitKeyboardAvoidMode0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'emitKeyboardAvoidMode0800';
      tcName = 'testKeyboardAvoidMode0800'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, 'false', 180180, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "keyboardAvoidMode", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /*
    * @tc.number     : SUB_WEB_KEYBOARDAVOIDMODE_0900
    * @tc.name       : testKeyboardAvoidMode0900
    * @tc.desc       : test KeyboardAvoidMode
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('emitKeyboardAvoidMode0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'emitKeyboardAvoidMode0900';
      tcName = 'testKeyboardAvoidMode0900'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, 'false', 180190, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "keyboardAvoidMode", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /*
    * @tc.number     : SUB_WEB_KEYBOARDAVOIDMODE_1000
    * @tc.name       : testKeyboardAvoidMode1000
    * @tc.desc       : test KeyboardAvoidMode
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('emitKeyboardAvoidMode1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'emitKeyboardAvoidMode1000';
      tcName = 'testKeyboardAvoidMode1000'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, 'false', 180200, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "keyboardAvoidMode", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /*
    * @tc.number     : SUB_WEB_KEYBOARDAVOIDMODE_1100
    * @tc.name       : testKeyboardAvoidMode1100
    * @tc.desc       : test KeyboardAvoidMode
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('emitKeyboardAvoidMode1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'emitKeyboardAvoidMode1100';
      tcName = 'testKeyboardAvoidMode1100'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, 'false', 180210, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "keyboardAvoidMode", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /*
    * @tc.number     : SUB_WEB_KEYBOARDAVOIDMODE_1200
    * @tc.name       : testKeyboardAvoidMode1200
    * @tc.desc       : test KeyboardAvoidMode
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('emitKeyboardAvoidMode1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'emitKeyboardAvoidMode1200';
      tcName = 'testKeyboardAvoidMode1200'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, 'false', 180220, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "keyboardAvoidMode", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /*
    * @tc.number     : SUB_WEB_KEYBOARDAVOIDMODE_1300
    * @tc.name       : testKeyboardAvoidMode1300
    * @tc.desc       : test KeyboardAvoidMode
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('emitKeyboardAvoidMode1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'emitKeyboardAvoidMode1300';
      tcName = 'testKeyboardAvoidMode1300'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, 'true', 180230, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "keyboardAvoidMode", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /*
    * @tc.number     : SUB_WEB_KEYBOARDAVOIDMODE_1400
    * @tc.name       : testKeyboardAvoidMode1400
    * @tc.desc       : test KeyboardAvoidMode
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('emitKeyboardAvoidMode1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'emitKeyboardAvoidMode1400';
      tcName = 'testKeyboardAvoidMode1400'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, 'true', 180240, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "keyboardAvoidMode", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /*
    * @tc.number     : SUB_WEB_KEYBOARDAVOIDMODE_1500
    * @tc.name       : testKeyboardAvoidMode1500
    * @tc.desc       : test KeyboardAvoidMode
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('emitKeyboardAvoidMode1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'emitKeyboardAvoidMode1500';
      tcName = 'testKeyboardAvoidMode1500'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, 'true', 180250, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "keyboardAvoidMode", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /*
    * @tc.number     : SUB_WEB_KEYBOARDAVOIDMODE_1600
    * @tc.name       : testKeyboardAvoidMode1600
    * @tc.desc       : test KeyboardAvoidMode
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('emitKeyboardAvoidMode1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'emitKeyboardAvoidMode1600';
      tcName = 'testKeyboardAvoidMode1600'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, 'true', 180260, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "keyboardAvoidMode", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /*
    * @tc.number     : SUB_WEB_KEYBOARDAVOIDMODE_1700
    * @tc.name       : testKeyboardAvoidMode1700
    * @tc.desc       : test KeyboardAvoidMode
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('emitKeyboardAvoidMode1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'emitKeyboardAvoidMode1700';
      tcName = 'testKeyboardAvoidMode1700'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, 'true', 180270, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "keyboardAvoidMode", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /*
    * @tc.number     : SUB_WEB_KEYBOARDAVOIDMODE_1800
    * @tc.name       : testKeyboardAvoidMode1800
    * @tc.desc       : test KeyboardAvoidMode
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('emitKeyboardAvoidMode1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'emitKeyboardAvoidMode1800';
      tcName = 'testKeyboardAvoidMode1800'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, 'true', 180280, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "keyboardAvoidMode", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /*
    * @tc.number     : SUB_WEB_KEYBOARDAVOIDMODE_1900
    * @tc.name       : testKeyboardAvoidMode1900
    * @tc.desc       : test KeyboardAvoidMode
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('emitKeyboardAvoidMode1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'emitKeyboardAvoidMode1900';
      tcName = 'testKeyboardAvoidMode1900'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, 'true', 180290, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "keyboardAvoidMode", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /*
    * @tc.number     : SUB_WEB_KEYBOARDAVOIDMODE_2000
    * @tc.name       : testKeyboardAvoidMode2000
    * @tc.desc       : test KeyboardAvoidMode
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('emitKeyboardAvoidMode2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'emitKeyboardAvoidMode2000';
      tcName = 'testKeyboardAvoidMode2000'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, 'true', 180300, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "keyboardAvoidMode", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /*
    * @tc.number     : SUB_WEB_KEYBOARDAVOIDMODE_2100
    * @tc.name       : testKeyboardAvoidMode2100
    * @tc.desc       : test KeyboardAvoidMode
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('emitKeyboardAvoidMode2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'emitKeyboardAvoidMode2100';
      tcName = 'testKeyboardAvoidMode2100'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, 'true', 180310, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "keyboardAvoidMode", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /*
    * @tc.number     : SUB_WEB_KEYBOARDAVOIDMODE_2200
    * @tc.name       : testKeyboardAvoidMode2200
    * @tc.desc       : test KeyboardAvoidMode
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('emitKeyboardAvoidMode2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'emitKeyboardAvoidMode2200';
      tcName = 'testKeyboardAvoidMode2200'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, 'true', 180320, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "keyboardAvoidMode", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /*
    * @tc.number     : SUB_WEB_KEYBOARDAVOIDMODE_2300
    * @tc.name       : testKeyboardAvoidMode2300
    * @tc.desc       : test KeyboardAvoidMode
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('emitKeyboardAvoidMode2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'emitKeyboardAvoidMode2300';
      tcName = 'testKeyboardAvoidMode2300'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, 'true', 180330, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "keyboardAvoidMode", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /*
    * @tc.number     : SUB_WEB_KEYBOARDAVOIDMODE_2400
    * @tc.name       : testKeyboardAvoidMode2400
    * @tc.desc       : test KeyboardAvoidMode
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('emitKeyboardAvoidMode2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'emitKeyboardAvoidMode2400';
      tcName = 'testKeyboardAvoidMode2400'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, 'true', 180340, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "keyboardAvoidMode", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /*
    * @tc.number     : SUB_WEB_KEYBOARDAVOIDMODE_2500
    * @tc.name       : testKeyboardAvoidMode2500
    * @tc.desc       : test KeyboardAvoidMode
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('emitKeyboardAvoidMode2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'emitKeyboardAvoidMode2500';
      tcName = 'testKeyboardAvoidMode2500'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, 'false', 180350, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "keyboardAvoidMode", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /*
    * @tc.number     : SUB_WEB_KEYBOARDAVOIDMODE_2600
    * @tc.name       : testKeyboardAvoidMode2600
    * @tc.desc       : test KeyboardAvoidMode
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('emitKeyboardAvoidMode2600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'emitKeyboardAvoidMode2600';
      tcName = 'testKeyboardAvoidMode2600'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, 'false', 180360, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "keyboardAvoidMode", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /*
    * @tc.number     : SUB_WEB_KEYBOARDAVOIDMODE_2700
    * @tc.name       : testKeyboardAvoidMode2700
    * @tc.desc       : test KeyboardAvoidMode
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('emitKeyboardAvoidMode2700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'emitKeyboardAvoidMode2700';
      tcName = 'testKeyboardAvoidMode2700'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, 'false', 180370, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "keyboardAvoidMode", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /*
    * @tc.number     : SUB_WEB_KEYBOARDAVOIDMODE_2800
    * @tc.name       : testKeyboardAvoidMode2800
    * @tc.desc       : test KeyboardAvoidMode
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('emitKeyboardAvoidMode2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'emitKeyboardAvoidMode2800';
      tcName = 'testKeyboardAvoidMode2800'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, 'false', 180380, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "keyboardAvoidMode", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /*
    * @tc.number     : SUB_WEB_KEYBOARDAVOIDMODE_2900
    * @tc.name       : testKeyboardAvoidMode2900
    * @tc.desc       : test KeyboardAvoidMode
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('emitKeyboardAvoidMode2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'emitKeyboardAvoidMode2900';
      tcName = 'testKeyboardAvoidMode2900'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, 'false', 180390, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "keyboardAvoidMode", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })

    /*
    * @tc.number     : SUB_WEB_KEYBOARDAVOIDMODE_3000
    * @tc.name       : testKeyboardAvoidMode3000
    * @tc.desc       : test KeyboardAvoidMode
    * @tc.size       : MediumTest
    * @tc.type       : Function
    * @tc.level      : Level 1
    */
    it('emitKeyboardAvoidMode3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      emitKey = 'emitKeyboardAvoidMode3000';
      tcName = 'testKeyboardAvoidMode3000'
      Utils.emitEvent(emitKey, EVENT_ID_SET_SUITE_KEY)
      let isReturn = false;
      Utils.registerEvent(tcName, 'false', 180400, () => { isReturn = true });
      Utils.waitAndClickComponent(driver, "keyboardAvoidMode", tcName);
      await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', true, 1000);
      done();
    })


  })
}
