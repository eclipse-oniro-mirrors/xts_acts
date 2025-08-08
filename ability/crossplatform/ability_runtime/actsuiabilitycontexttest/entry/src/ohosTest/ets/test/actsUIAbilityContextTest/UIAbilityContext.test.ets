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

import common from '@ohos.app.ability.common';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import { BusinessError } from '@ohos.base';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';

import Want from '@ohos.app.ability.Want';

interface ParametersType {
  key1: boolean;
  key2: number;
  key3: string;
}

let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();

function sleep(time: number) {
  return new Promise((resolve: (value: string) => void) => {
    setTimeout(() => {
      resolve("ok")
    }, time)
  }).then(() => {
    console.info(`sleep ${time} over...`)
  })
}

export default function UIAbilityContext() {
  describe("UIAbilityContext", () => {
    let bundleName: string;


    beforeAll(async () => {
      console.info("beforeAll case");
    });

    beforeEach(async () => {
      console.info("beforeEach case");
    });

    afterEach(async () => {
      console.info('afterEach case');
    });

    afterAll(async () => {
      console.info("afterAll case");
    });

    /**
     * @tc.number    : ABILITY_TEST_ABILITYINFO_0100
     * @tc.name      : testAbilityInfo001
     * @tc.desc      : test AbilityInfo
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testAbilityInfo001', Level.LEVEL0, async (done: Function) => {
      try {
        let context: common.UIAbilityContext = globalThis.abilityContext;
        expect(context != null).assertTrue();
        let abilityInfo = context.abilityInfo;
        expect(abilityInfo != null).assertTrue();

        console.log(`testAbilityInfo001 abilityInfo.bundleName: ` + abilityInfo.bundleName);
        expect(abilityInfo.bundleName == "com.example.uiabilitycontexttest").assertTrue();
        console.log(`testAbilityInfo001 abilityInfo.moduleName: ` + abilityInfo.moduleName);
        expect(abilityInfo.moduleName == "entryTest").assertTrue();
        console.log(`testAbilityInfo001 abilityInfo.name: ` + abilityInfo.name);
        expect(abilityInfo.name == "TestAbility").assertTrue();
        console.log(`testAbilityInfo001 abilityInfo.label: ` + abilityInfo.label);
        expect(abilityInfo.label == "$string:TestAbility_label").assertTrue();
        console.log(`testAbilityInfo001 abilityInfo.labelId: ` + abilityInfo.labelId);
        expect(typeof (abilityInfo.labelId) == 'number').assertTrue();
        console.log(`testAbilityInfo001 abilityInfo.description: ` + abilityInfo.description);
        expect(abilityInfo.description == "$string:TestAbility_desc").assertTrue();
        console.log(`testAbilityInfo001 abilityInfo.descriptionId: ` + abilityInfo.descriptionId);
        expect(typeof (abilityInfo.descriptionId) == 'number').assertTrue();
        console.log(`testAbilityInfo001 abilityInfo.icon: ` + abilityInfo.icon);
        expect(abilityInfo.icon == "$media:icon").assertTrue();
        console.log(`testAbilityInfo001 abilityInfo.iconId: ` + abilityInfo.iconId);
        expect(typeof (abilityInfo.iconId) == 'number').assertTrue();
        console.log(`testAbilityInfo001 abilityInfo.applicationInfo: ` + abilityInfo.applicationInfo.name);
        expect(abilityInfo.applicationInfo.name == "com.example.uiabilitycontexttest").assertTrue();
        console.log(`testAbilityInfo001 abilityInfo.metadata: ` + abilityInfo.metadata.length);
        expect(abilityInfo.metadata.length >= 0).assertTrue();

        console.log(`testAbilityInfo001 success`);
        done();
      } catch (err) {
        console.log(`testAbilityInfo001 fail: ` + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : ABILITY_TEST_UIABILITYCONTEXT_CURRENTHAPMODULEINFO_0100
     * @tc.name      : testUIAbilityContextCurrentHapModuleInfo001
     * @tc.desc      : test filed of currentHapModuleInfo
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testUIAbilityContextCurrentHapModuleInfo001', Level.LEVEL0, async (done: Function) => {
      try {
        let context: common.UIAbilityContext = globalThis.abilityContext;
        expect(context != null).assertTrue();
        let hapModuleInfo = context.currentHapModuleInfo;
        expect(hapModuleInfo != null).assertTrue();

        console.log(`testUIAbilityContextCurrentHapModuleInfo001 hapModuleInfo.name: ` + hapModuleInfo.name);
        expect(hapModuleInfo.name == "entryTest").assertTrue();
        console.log(`testUIAbilityContextCurrentHapModuleInfo001 hapModuleInfo.icon: ` + hapModuleInfo.icon);
        expect(hapModuleInfo.icon == "$media:icon").assertTrue();
        console.log(`testUIAbilityContextCurrentHapModuleInfo001 hapModuleInfo.iconId: ` + hapModuleInfo.iconId);
        expect(typeof (hapModuleInfo.iconId) == 'number').assertTrue();
        console.log(`testUIAbilityContextCurrentHapModuleInfo001 hapModuleInfo.label: ` + hapModuleInfo.label);
        expect(hapModuleInfo.label == "$string:TestAbility_label").assertTrue();
        console.log(`testUIAbilityContextCurrentHapModuleInfo001 hapModuleInfo.labelId: ` + hapModuleInfo.labelId);
        expect(typeof (hapModuleInfo.labelId) == 'number').assertTrue();
        console.log(`testUIAbilityContextCurrentHapModuleInfo001 hapModuleInfo.description: ` + hapModuleInfo.description);
        expect(hapModuleInfo.description == "$string:module_test_desc").assertTrue();
        console.log(`testUIAbilityContextCurrentHapModuleInfo001 hapModuleInfo.descriptionId: ` + hapModuleInfo.descriptionId);
        expect(typeof (hapModuleInfo.descriptionId) == 'number').assertTrue();
        console.log(`testUIAbilityContextCurrentHapModuleInfo001 hapModuleInfo.mainElementName: ` + hapModuleInfo.mainElementName);
        expect(hapModuleInfo.mainElementName == "TestAbility").assertTrue();
        console.log(`testUIAbilityContextCurrentHapModuleInfo001 hapModuleInfo.metadata: ` + hapModuleInfo.metadata.length);
        expect(hapModuleInfo.metadata.length >= 0).assertTrue();

        console.log(`testUIAbilityContextCurrentHapModuleInfo001 success`);
        done();
      } catch (err) {
        console.log(`testUIAbilityContextCurrentHapModuleInfo001 fail: ` + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : ABILITY_TEST_UIABILITYCONTEXT_CONFIG_0100
     * @tc.name      : testUIAbilityContextConfig001
     * @tc.desc      : test filed of config
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testUIAbilityContextConfig001', Level.LEVEL0, async (done: Function) => {
      try {
        let context: common.UIAbilityContext = globalThis.abilityContext;
        expect(context != null).assertTrue();
        let config = context.config;
        expect(config != null).assertTrue();

        console.log(`testUIAbilityContextConfig001 config.colorMode: ` + config.colorMode);
        expect(typeof (config.colorMode) == 'number').assertTrue();
        console.log(`testUIAbilityContextConfig001 config.direction: ` + config.direction);
        expect(typeof (config.direction) == 'number').assertTrue();

        console.log(`testUIAbilityContextConfig001 success`);
        done();
      } catch (err) {
        console.log(`testUIAbilityContextConfig001 fail: ` + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : ABILITY_TEST_STARTABILITY_PROMISE_0100
     * @tc.name      : testStartAbilityPromise001
     * @tc.desc      : test startAbility right
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testStartAbilityPromise001', Level.LEVEL0, async (done: Function) => {
      try {
        let context: common.UIAbilityContext = globalThis.abilityContext;
        expect(context != null).assertTrue();

        let want: Want = {
          "bundleName": "com.example.uiabilitycontexttest",
          "abilityName": "MainAbility1",
          "moduleName": "entryTest"
        }
        context.startAbility(want).then(() => {
          console.info('testStartAbilityPromise001 start successful.');
        }).catch((error: BusinessError) => {
          console.error('testStartAbilityPromise001 start failed. Cause: ' + JSON.stringify(error.message));
        })
        await sleep(1500);
        const result: string[] = globalThis.list1;
        console.info('result: ' + JSON.stringify(result));
        expect(result[0]).assertEqual('MainAbility1 onCreate');

        let context1: common.UIAbilityContext = globalThis.ability1Context;
        context1.terminateSelf();
        await sleep(1000);

        console.log(`testStartAbilityPromise001 success`);
        done();
      } catch (err) {
        console.log(`testStartAbilityPromise001 fail: ` + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : ABILITY_TEST_STARTABILITY_PROMISE_0200
     * @tc.name      : testStartAbilityPromise002
     * @tc.desc      : test startAbility wrong want
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testStartAbilityPromise002', Level.LEVEL0, async (done: Function) => {
      try {
        let context: common.UIAbilityContext = globalThis.abilityContext;
        let want: Want = {
          "bundleName": "com.example.abc",
          "abilityName": "MainAbility1",
          "moduleName": "entryTest"
        }
        context.startAbility(want).then(() => {
          console.log(`testStartAbilityPromise002 fail: `);
          expect().assertFail();
          done();
        }).catch((error: BusinessError) => {
          console.log(`testStartAbilityPromise002 error.code: ` + error.code);
          expect(true).assertTrue();
          done();
        })
      } catch (err) {
        console.log(`testStartAbilityPromise002 fail: ` + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : ABILITY_TEST_STARTABILITY_PROMISE_0300
     * @tc.name      : testStartAbilityPromise003
     * @tc.desc      : test startAbility wrong want
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testStartAbilityPromise003', Level.LEVEL0, async (done: Function) => {
      try {
        let context: common.UIAbilityContext = globalThis.abilityContext;
        let want: Want = {
          "bundleName": " ",
          "abilityName": "MainAbility1",
          "moduleName": "entryTest"
        }
        context.startAbility(want).then(() => {
          console.log(`testStartAbilityPromise003 fail: `);
          expect().assertFail();
          done();
        }).catch((error: BusinessError) => {
          console.log(`testStartAbilityPromise003 error.code: ` + error.code);
          expect(true).assertTrue();
          done();
        })
      } catch (err) {
        console.log(`testStartAbilityPromise003 fail: ` + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : ABILITY_TEST_STARTABILITY_PROMISE_0400
     * @tc.name      : testStartAbilityPromise004
     * @tc.desc      : test startAbility wrong want
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testStartAbilityPromise004', Level.LEVEL0, async (done: Function) => {
      try {
        let context: common.UIAbilityContext = globalThis.abilityContext;
        let want: Want = {
          "abilityName": "MainAbility1",
          "moduleName": "entryTest"
        }
        context.startAbility(want).then(() => {
          console.log(`testStartAbilityPromise004 fail: `);
          expect().assertFail();
          done();
        }).catch((error: BusinessError) => {
          console.log(`testStartAbilityPromise004 error.code: ` + error.code);
          expect(true).assertTrue();
          done();
        })
      } catch (err) {
        console.log(`testStartAbilityPromise004 fail: ` + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : ABILITY_TEST_STARTABILITY_PROMISE_0500
     * @tc.name      : testStartAbilityPromise005
     * @tc.desc      : test startAbility wrong want
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testStartAbilityPromise005', Level.LEVEL0, async (done: Function) => {
      try {
        let context: common.UIAbilityContext = globalThis.abilityContext;
        let want: Want = {
          "bundleName": "com.example.uiabilitycontexttest123",
          "abilityName": "MainAbility1",
          "moduleName": "abc"
        }
        context.startAbility(want).then(() => {
          console.log(`testStartAbilityPromise005 fail: `);
          expect().assertFail();
          done();
        }).catch((error: BusinessError) => {
          console.log(`testStartAbilityPromise005 error.code: ` + error.code);
          expect(true).assertTrue();
          done();
        })
      } catch (err) {
        console.log(`testStartAbilityPromise005 fail: ` + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : ABILITY_TEST_STARTABILITY_PROMISE_0600
     * @tc.name      : testStartAbilityPromise006
     * @tc.desc      : test startAbility wrong want
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testStartAbilityPromise006', Level.LEVEL0, async (done: Function) => {
      try {
        let context: common.UIAbilityContext = globalThis.abilityContext;
        let want: Want = {
          "bundleName": "com.example.uiabilitycontexttest123",
          "abilityName": "MainAbility1",
          "moduleName": " "
        }
        context.startAbility(want).then(() => {
          console.log(`testStartAbilityPromise006 fail `);
          expect().assertFail();
          done();
        }).catch((error: BusinessError) => {
          console.log(`testStartAbilityPromise006 error.code: ` + error.code);
          expect(true).assertTrue();
          done();
        })
      } catch (err) {
        console.log(`testStartAbilityPromise006 fail: ` + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : ABILITY_TEST_STARTABILITY_PROMISE_0700
     * @tc.name      : testStartAbilityPromise007
     * @tc.desc      : test startAbility right want
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testStartAbilityPromise007', Level.LEVEL0, async (done: Function) => {
      try {
        let context: common.UIAbilityContext = globalThis.abilityContext;
        expect(context != null).assertTrue();

        let want: Want = {
          "bundleName": "com.example.uiabilitycontexttest",
          "abilityName": "MainAbility1"
        }
        context.startAbility(want).then(() => {
          console.info('testStartAbilityPromise007 start successful.');
        }).catch((error: BusinessError) => {
          console.error('testStartAbilityPromise007 start failed. Cause: ' + JSON.stringify(error));
        })
        await sleep(1500);
        const result: string[] = globalThis.list1;
        console.info('result: ' + JSON.stringify(result));
        expect(result[0]).assertEqual('MainAbility1 onCreate');

        let context1: common.UIAbilityContext = globalThis.ability1Context;
        context1.terminateSelf();
        await sleep(1000);

        console.log(`testStartAbilityPromise007 success`);
        done();
      } catch (err) {
        console.log(`testStartAbilityPromise007 fail: ` + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : ABILITY_TEST_STARTABILITY_PROMISE_0800
     * @tc.name      : testStartAbilityPromise008
     * @tc.desc      : test startAbility wrong want
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testStartAbilityPromise008', Level.LEVEL0, async (done: Function) => {
      try {
        let context: common.UIAbilityContext = globalThis.abilityContext;
        let want: Want = {
          "bundleName": "com.example.uiabilitycontexttest123",
          "abilityName": "abc",
          "moduleName": "entryTest"
        }
        context.startAbility(want).then(() => {
          console.log(`testStartAbilityPromise008 fail: `);
          expect().assertFail();
          done();
        }).catch((error: BusinessError) => {
          console.log(`testStartAbilityPromise008 error.code: ` + error.code);
          expect(true).assertTrue();
          done();
        })
      } catch (err) {
        console.log(`testStartAbilityPromise008 fail: ` + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : ABILITY_TEST_STARTABILITY_PROMISE_0900
     * @tc.name      : testStartAbilityPromise009
     * @tc.desc      : test startAbility wrong want
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testStartAbilityPromise009', Level.LEVEL0, async (done: Function) => {
      try {
        let context: common.UIAbilityContext = globalThis.abilityContext;
        let want: Want = {
          "bundleName": "com.example.uiabilitycontexttest123",
          "abilityName": " ",
          "moduleName": "entryTest"
        }
        context.startAbility(want).then(() => {
          console.log(`testStartAbilityPromise009 fail: `);
          expect().assertFail();
          done();
        }).catch((error: BusinessError) => {
          console.log(`testStartAbilityPromise009 error.code: ` + error.code);
          expect(true).assertTrue();
          done();
        })
      } catch (err) {
        console.log(`testStartAbilityPromise009 fail: ` + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : ABILITY_TEST_STARTABILITY_PROMISE_1000
     * @tc.name      : testStartAbilityPromise010
     * @tc.desc      : test startAbility wrong want
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testStartAbilityPromise010', Level.LEVEL0, async (done: Function) => {
      try {
        let context: common.UIAbilityContext = globalThis.abilityContext;
        let want: Want = {
          "bundleName": "com.example.uiabilitycontexttest123",
          "moduleName": "entryTest"
        }
        context.startAbility(want).then(() => {
          console.log(`testStartAbilityPromise010 fail: `);
          expect().assertFail();
          done();
        }).catch((error: BusinessError) => {
          console.log(`testStartAbilityPromise010 error.code: ` + error.code);
          expect(true).assertTrue();
          done();
        })
      } catch (err) {
        console.log(`testStartAbilityPromise010 fail: ` + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : ABILITY_TEST_STARTABILITY_PROMISE_1100
     * @tc.name      : testStartAbilityPromise011
     * @tc.desc      : test startAbility wrong want
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testStartAbilityPromise011', Level.LEVEL0, async (done: Function) => {
      try {
        let context: common.UIAbilityContext = globalThis.abilityContext;
        let want: Want = {
          "bundleName": "com.example.uiabilitycontexttest123"
        }
        context.startAbility(want).then(() => {
          console.log(`testStartAbilityPromise011 fail: `);
          expect().assertFail();
          done();
        }).catch((error: BusinessError) => {
          console.log(`testStartAbilityPromise011 error.code: ` + error.code);
          expect(true).assertTrue();
          done();
        })
      } catch (err) {
        console.log(`testStartAbilityPromise011 fail: ` + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : ABILITY_TEST_STARTABILITY_PROMISE_1200
     * @tc.name      : testStartAbilityPromise012
     * @tc.desc      : test startAbility right
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testStartAbilityPromise012', Level.LEVEL0, async (done: Function) => {
      try {
        let context: common.UIAbilityContext = globalThis.abilityContext;
        expect(context != null).assertTrue();

        let want: Want = {
          "bundleName": "com.example.uiabilitycontexttest",
          "abilityName": "MainAbility1",
          "moduleName": "entryTest",
          "parameters": {
            "key1": true,
            "key2": 1,
            "key3": "this is string"
          }
        }
        context.startAbility(want).then(() => {
          console.info('testStartAbilityPromise012 start successful.');
        }).catch((error: BusinessError) => {
          console.error('testStartAbilityPromise012 start failed. Cause: ' + JSON.stringify(error));
        })
        await sleep(1500);
        const result: string[] = globalThis.list1;
        const parameters:ParametersType = globalThis.parameters;
        console.info('result: ' + JSON.stringify(result));
        console.info('parameters: ' + JSON.stringify(parameters));
        expect(result[0]).assertEqual('MainAbility1 onCreate');
        expect(parameters.key1).assertEqual(true);
        expect(parameters.key2).assertEqual(1);
        expect(parameters.key3).assertEqual("this is string");
        let context1: common.UIAbilityContext = globalThis.ability1Context;
        context1.terminateSelf();
        await sleep(1000);

        console.log(`testStartAbilityPromise012 success`);
        done();
      } catch (err) {
        console.log(`testStartAbilityPromise012 fail: ` + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : ABILITY_TEST_STARTABILITY_PROMISE_1300
     * @tc.name      : testStartAbilityPromise013
     * @tc.desc      : test startAbility right
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testStartAbilityPromise013', Level.LEVEL0, async (done: Function) => {
      try {
        let context: common.UIAbilityContext = globalThis.abilityContext;
        expect(context != null).assertTrue();

        let want: Want = {
          "bundleName": "com.example.uiabilitycontexttest",
          "abilityName": "MainAbility1",
          "moduleName": "entryTest"
        }

        context.startAbility(want).then(() => {
          console.info('testStartAbilityPromise013 start1 successful.');
        }).catch((error: BusinessError) => {
          console.error('testStartAbilityPromise013 start1 failed. Cause: ' + JSON.stringify(error));
        })
        await sleep(1000);
        const result: string[] = globalThis.list1;
        console.info('result: ' + JSON.stringify(result));
        expect(result[0]).assertEqual('MainAbility1 onCreate');
        let context1: common.UIAbilityContext = globalThis.ability1Context;

        context.startAbility(want).then(() => {
          console.info('testStartAbilityPromise013 start2 successful.');
        }).catch((error: BusinessError) => {
          console.error('testStartAbilityPromise013 start2 failed. Cause: ' + JSON.stringify(error));
        })
        await sleep(1000);
        const result2: string[] = globalThis.list1
        console.info('result2: ' + JSON.stringify(result2));
        expect(result2[0]).assertEqual('MainAbility1 onCreate');
        let context2: common.UIAbilityContext = globalThis.ability1Context;

        context1.terminateSelf();
        await sleep(1000);
        context2.terminateSelf();
        await sleep(1000);

        console.log(`testStartAbilityPromise013 success`);
        done();
      } catch (err) {
        console.log(`testStartAbilityPromise013 fail: ` + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : ABILITY_TEST_STARTABILITY_CALLBACK_0100
     * @tc.name      : testStartAbilityCallback001
     * @tc.desc      : test startAbility right
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testStartAbilityCallback001', Level.LEVEL0, async (done: Function) => {
      try {
        let context: common.UIAbilityContext = globalThis.abilityContext;
        expect(context != null).assertTrue();

        let want: Want = {
          "bundleName": "com.example.uiabilitycontexttest",
          "abilityName": "MainAbility1",
          "moduleName": "entryTest"
        }
        context.startAbility(want, (err) => {
          if (err.code) {
            console.log(`testStartAbilityCallback001 fail: ` + err);
            expect().assertFail();
            done();
          }
          console.info('testStartAbilityCallback001 startAbility succeed');
        })
        await sleep(1500);
        const result: string[] = globalThis.list1;
        console.info('result: ' + JSON.stringify(result));
        expect(result[0]).assertEqual('MainAbility1 onCreate');

        let context1: common.UIAbilityContext = globalThis.ability1Context;
        context1.terminateSelf();
        await sleep(1000);

        console.log(`testStartAbilityCallback001 success`);
        done();
      } catch (err) {
        console.log(`testStartAbilityCallback001 fail: ` + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : ABILITY_TEST_STARTABILITY_CALLBACK_0200
     * @tc.name      : testStartAbilityCallback002
     * @tc.desc      : test startAbility wrong want
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testStartAbilityCallback002', Level.LEVEL0, async (done: Function) => {
      try {
        let context: common.UIAbilityContext = globalThis.abilityContext;
        expect(context != null).assertTrue();

        let want: Want = {
          "bundleName": "com.example.abc",
          "abilityName": "MainAbility1",
          "moduleName": "entryTest"
        }
        context.startAbility(want, (err) => {
          if (err.code) {
            console.log(`testStartAbilityCallback002 err.code: ` + err.code);
            expect(true).assertTrue();
            done();
          } else {
            expect().assertFail();
            done();
          }
        })
      } catch (err) {
        console.log(`testStartAbilityCallback002 fail: ` + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : ABILITY_TEST_STARTABILITY_CALLBACK_0300
     * @tc.name      : testStartAbilityCallback003
     * @tc.desc      : test startAbility wrong want
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testStartAbilityCallback003', Level.LEVEL0, async (done: Function) => {
      try {
        let context: common.UIAbilityContext = globalThis.abilityContext;
        expect(context != null).assertTrue();

        let want: Want = {
          "bundleName": " ",
          "abilityName": "MainAbility1",
          "moduleName": "entryTest"
        }
        context.startAbility(want, (err) => {
          if (err.code) {
            console.log(`testStartAbilityCallback003 err.code: ` + err.code);
            expect(true).assertTrue();
            done();
          } else {
            expect().assertFail();
            done();
          }
        })
      } catch (err) {
        console.log(`testStartAbilityCallback003 fail: ` + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : ABILITY_TEST_STARTABILITY_CALLBACK_0400
     * @tc.name      : testStartAbilityCallback004
     * @tc.desc      : test startAbility wrong want
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testStartAbilityCallback004', Level.LEVEL0, async (done: Function) => {
      try {
        let context: common.UIAbilityContext = globalThis.abilityContext;
        expect(context != null).assertTrue();

        let want: Want = {
          "abilityName": "MainAbility1",
          "moduleName": "entryTest"
        }
        context.startAbility(want, (err) => {
          if (err.code) {
            console.log(`testStartAbilityCallback004 err.code: ` + err.code);
            expect(true).assertTrue();
            done();
          } else {
            expect().assertFail();
            done();
          }
        })
      } catch (err) {
        console.log(`testStartAbilityCallback004 fail: ` + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : ABILITY_TEST_STARTABILITY_CALLBACK_0500
     * @tc.name      : testStartAbilityCallback005
     * @tc.desc      : test startAbility wrong want
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testStartAbilityCallback005', Level.LEVEL0, async (done: Function) => {
      try {
        let context: common.UIAbilityContext = globalThis.abilityContext;
        expect(context != null).assertTrue();

        let want: Want = {
          "bundleName": "com.example.uiabilitycontexttest123",
          "abilityName": "MainAbility1",
          "moduleName": "abc"
        }
        context.startAbility(want, (err) => {
          if (err.code) {
            console.log(`testStartAbilityCallback005 err.code: ` + err.code);
            expect(true).assertTrue();
            done();
          } else {
            expect().assertFail();
            done();
          }
        })
      } catch (err) {
        console.log(`testStartAbilityCallback005 fail: ` + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : ABILITY_TEST_STARTABILITY_CALLBACK_0600
     * @tc.name      : testStartAbilityCallback006
     * @tc.desc      : test startAbility wrong want
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testStartAbilityCallback006', Level.LEVEL0, async (done: Function) => {
      try {
        let context: common.UIAbilityContext = globalThis.abilityContext;
        expect(context != null).assertTrue();

        let want: Want = {
          "bundleName": "com.example.uiabilitycontexttest123",
          "abilityName": "MainAbility1",
          "moduleName": " "
        }
        context.startAbility(want, (err) => {
          if (err.code) {
            console.log(`testStartAbilityCallback006 err.code: ` + err.code);
            expect(true).assertTrue();
            done();
          } else {
            expect().assertFail();
            done();
          }
        })
      } catch (err) {
        console.log(`testStartAbilityCallback006 fail: ` + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : ABILITY_TEST_STARTABILITY_CALLBACK_0700
     * @tc.name      : testStartAbilityCallback007
     * @tc.desc      : test startAbility right want
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testStartAbilityCallback007', Level.LEVEL0, async (done: Function) => {
      try {
        let context: common.UIAbilityContext = globalThis.abilityContext;
        expect(context != null).assertTrue();

        let want: Want = {
          "bundleName": "com.example.uiabilitycontexttest",
          "abilityName": "MainAbility1"
        }
        context.startAbility(want, (err) => {
          if (err.code) {
            console.log(`testStartAbilityCallback007 fail: ` + err);
            expect().assertFail();
            done();
          }
          console.info('testStartAbilityCallback007 startAbility succeed');
        })
        await sleep(1500);
        const result: string[] = globalThis.list1;
        console.info('result: ' + JSON.stringify(result));
        expect(result[0]).assertEqual('MainAbility1 onCreate');

        let context1: common.UIAbilityContext = globalThis.ability1Context;
        context1.terminateSelf();
        await sleep(1000);

        console.log(`testStartAbilityCallback007 success`);
        done();
      } catch (err) {
        console.log(`testStartAbilityCallback007 fail: ` + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : ABILITY_TEST_STARTABILITY_CALLBACK_0800
     * @tc.name      : testStartAbilityCallback008
     * @tc.desc      : test startAbility wrong want
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testStartAbilityCallback008', Level.LEVEL0, async (done: Function) => {
      try {
        let context: common.UIAbilityContext = globalThis.abilityContext;
        expect(context != null).assertTrue();

        let want: Want = {
          "bundleName": "com.example.uiabilitycontexttest123",
          "abilityName": "abc",
          "moduleName": "entryTest"
        }
        context.startAbility(want, (err) => {
          if (err.code) {
            console.log(`testStartAbilityCallback008 err.code: ` + err.code);
            expect(true).assertTrue();
            done();
          } else {
            expect().assertFail();
            done();
          }
        })
      } catch (err) {
        console.log(`testStartAbilityCallback008 fail: ` + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : ABILITY_TEST_STARTABILITY_CALLBACK_0900
     * @tc.name      : testStartAbilityCallback009
     * @tc.desc      : test startAbility wrong want
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testStartAbilityCallback009', Level.LEVEL0, async (done: Function) => {
      try {
        let context: common.UIAbilityContext = globalThis.abilityContext;
        expect(context != null).assertTrue();

        let want: Want = {
          "bundleName": "com.example.uiabilitycontexttest123",
          "abilityName": " ",
          "moduleName": "entryTest"
        }
        context.startAbility(want, (err) => {
          if (err.code) {
            console.log(`testStartAbilityCallback009 err.code: ` + err.code);
            expect(true).assertTrue();
            done();
          } else {
            expect().assertFail();
            done();
          }
        })
      } catch (err) {
        console.log(`testStartAbilityCallback009 fail: ` + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : ABILITY_TEST_STARTABILITY_CALLBACK_1000
     * @tc.name      : testStartAbilityCallback010
     * @tc.desc      : test startAbility wrong want
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testStartAbilityCallback010', Level.LEVEL0, async (done: Function) => {
      try {
        let context: common.UIAbilityContext = globalThis.abilityContext;
        expect(context != null).assertTrue();

        let want: Want = {
          "bundleName": "com.example.uiabilitycontexttest123",
          "moduleName": "entryTest"
        }
        context.startAbility(want, (err) => {
          if (err.code) {
            console.log(`testStartAbilityCallback010 err.code: ` + err.code);
            expect(true).assertTrue();
            done();
          } else {
            expect().assertFail();
            done();
          }
        })
      } catch (err) {
        console.log(`testStartAbilityCallback010 fail: ` + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : ABILITY_TEST_STARTABILITY_CALLBACK_1100
     * @tc.name      : testStartAbilityCallback011
     * @tc.desc      : test startAbility wrong want
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testStartAbilityCallback011', Level.LEVEL0, async (done: Function) => {
      try {
        let context: common.UIAbilityContext = globalThis.abilityContext;
        expect(context != null).assertTrue();

        let want: Want = {}
        context.startAbility(want, (err) => {
          if (err.code) {
            console.log(`testStartAbilityCallback011 err.code: ` + err.code);
            expect(true).assertTrue();
            done();
          } else {
            expect().assertFail();
            done();
          }
        })
      } catch (err) {
        console.log(`testStartAbilityCallback011 fail: ` + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : ABILITY_TEST_STARTABILITY_CALLBACK_1200
     * @tc.name      : testStartAbilityCallback012
     * @tc.desc      : test startAbility right
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testStartAbilityCallback012', Level.LEVEL0, async (done: Function) => {
      try {
        let context: common.UIAbilityContext = globalThis.abilityContext;
        expect(context != null).assertTrue();

        let want: Want = {
          "bundleName": "com.example.uiabilitycontexttest",
          "abilityName": "MainAbility1",
          "moduleName": "entryTest",
          "parameters": {
            "key1": true,
            "key2": 1,
            "key3": "this is string"
          }
        }
        context.startAbility(want, (err) => {
          if (err.code) {
            console.log(`testStartAbilityCallback012 fail: ` + err);
            expect().assertFail();
            done();
            return;
          }
          console.info('testStartAbilityCallback012 startAbility succeed');
        })
        await sleep(1500);
        const result: string[] = globalThis.list1;
        const parameters:ParametersType = globalThis.parameters;
        console.info('result: ' + JSON.stringify(result));
        console.info('parameters: ' + JSON.stringify(parameters));
        expect(result[0]).assertEqual('MainAbility1 onCreate');
        expect(parameters.key1).assertEqual(true);
        expect(parameters.key2).assertEqual(1);
        expect(parameters.key3).assertEqual("this is string");

        let context1: common.UIAbilityContext = globalThis.ability1Context;
        context1.terminateSelf();
        await sleep(1000);

        console.log(`testStartAbilityCallback012 success`);
        done();
      } catch (err) {
        console.log(`testStartAbilityCallback012 fail: ` + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : ABILITY_TEST_STARTABILITY_CALLBACK_1300
     * @tc.name      : testStartAbilityCallback013
     * @tc.desc      : test startAbility right
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it('testStartAbilityCallback013', Level.LEVEL0, async (done: Function) => {
      try {
        let context: common.UIAbilityContext = globalThis.abilityContext;
        expect(context != null).assertTrue();

        let want: Want = {
          "bundleName": "com.example.uiabilitycontexttest",
          "abilityName": "MainAbility1",
          "moduleName": "entryTest"
        }

        context.startAbility(want, (err) => {
          if (err.code) {
            console.log(`testStartAbilityCallback013 fail1: ` + err);
            expect().assertFail();
            done();
            return;
          }
          console.info('testStartAbilityCallback013 startAbility1 succeed');
        })
        await sleep(1000);
        const result: string[] = globalThis.list1;
        console.info('result: ' + JSON.stringify(result));
        expect(result[0]).assertEqual('MainAbility1 onCreate');
        let context1: common.UIAbilityContext = globalThis.ability1Context;

        await sleep(500);
        context.startAbility(want, (err) => {
          if (err.code) {
            console.log(`testStartAbilityCallback013 fail2: ` + err);
            expect().assertFail();
            done();
            return;
          }
          console.info('testStartAbilityCallback013 startAbility2 succeed');
        })
        await sleep(1000);
        const result2: string[] = globalThis.list1
        console.info('result: ' + JSON.stringify(result2));
        expect(result2[0]).assertEqual('MainAbility1 onCreate');
        let context2: common.UIAbilityContext = globalThis.ability1Context;

        context1.terminateSelf();
        await sleep(1000);
        context2.terminateSelf();
        await sleep(1000);

        console.log(`testStartAbilityCallback013 success`);
        done();
      } catch (err) {
        console.log(`testStartAbilityCallback013 fail: ` + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : ABILITY_TEST_APPLICATIONINFO_PROMISE_0100
     * @tc.name      : testTerminateSelfPromise001
     * @tc.desc      : test terminateSelf(Promise)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testTerminateSelfPromise001', Level.LEVEL0, async (done: Function) => {
      try {
        let context: common.UIAbilityContext = globalThis.abilityContext;
        expect(context != null).assertTrue();

        let want: Want = {
          "bundleName": "com.example.uiabilitycontexttest",
          "abilityName": "MainAbility1",
          "moduleName": "entryTest"
        }
        context.startAbility(want).then(() => {
          console.info('testTerminateSelfPromise001 start successful. ');
        }).catch((error: BusinessError) => {
          console.error('testTerminateSelfPromise001 start failed. Cause: ' + JSON.stringify(error));
        })
        await sleep(1500);

        let context1: common.UIAbilityContext = globalThis.ability1Context;
        context1.terminateSelf();
        await sleep(1000);

        const result: string[] = globalThis.list1;
        console.info('result: ' + JSON.stringify(result));
        expect(result[1]).assertEqual('MainAbility1 onDestroy');

        console.log(`testTerminateSelfPromise001 success`);
        done();
      } catch (err) {
        console.log(`testTerminateSelfPromise001 fail: ` + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : ABILITY_TEST_APPLICATIONINFO_CALLBACK_0100
     * @tc.name      : testTerminateSelfCallback001
     * @tc.desc      : test terminateSelf(Callback)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testTerminateSelfCallback001', Level.LEVEL0, async (done: Function) => {
      try {
        let context: common.UIAbilityContext = globalThis.abilityContext;
        expect(context != null).assertTrue();

        let want: Want = {
          "bundleName": "com.example.uiabilitycontexttest",
          "abilityName": "MainAbility1",
          "moduleName": "entryTest"
        }
        context.startAbility(want).then(() => {
          console.info('testTerminateSelfCallback001 start successful. ');
        }).catch((error: BusinessError) => {
          console.error('testTerminateSelfCallback001 start failed. Cause: ' + JSON.stringify(error));
        })
        await sleep(1500);

        let context1: common.UIAbilityContext = globalThis.ability1Context;
        context1.terminateSelf((err) => {
          if (err.code) {
            console.log(`testTerminateSelfCallback001 fail: ` + err);
            expect().assertFail();
            done();
          }
        })
        await sleep(1000);

        const result: string[] = globalThis.list1;
        console.info('result: ' + JSON.stringify(result));
        expect(result[1]).assertEqual('MainAbility1 onDestroy');

        console.log(`testApplicationInfoCallback001 success`);
        done();
      } catch (err) {
        console.log(`testApplicationInfoCallback001 fail: ` + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : ABILITY_TEST_STAGEMODE_0100
     * @tc.name      : testStageMode001
     * @tc.desc      : test filed of stageMode
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testStageMode001', Level.LEVEL0, async (done: Function) => {
      try {
        let context: common.UIAbilityContext = globalThis.abilityContext;
        expect(context.stageMode).assertTrue();
        console.log(`testStageMode001 success`);
        done();
      } catch (err) {
        console.log(`testStageMode001 fail: ` + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : ABILITY_TEST_RESOURCEMANAGER_0100
     * @tc.name      : testResourceManager001
     * @tc.desc      : test filed of resourceManager
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testResourceManager001', Level.LEVEL0, async (done: Function) => {
      try {
        let context: common.UIAbilityContext = globalThis.abilityContext;
        expect(context.resourceManager != null).assertTrue();
        console.log(`testResourceManager001 success`);
        done();
      } catch (err) {
        console.log(`testResourceManager001 fail: ` + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : ABILITY_TEST_APPLICATIONINFO_0100
     * @tc.name      : testApplicationInfo001
     * @tc.desc      : test filed of applicationInfo
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testApplicationInfo001', Level.LEVEL0, async (done: Function) => {
      try {
        let context: common.UIAbilityContext = globalThis.abilityContext;
        expect(context != null).assertTrue();
        let applicationInfo = context.applicationInfo;
        expect(applicationInfo != null).assertTrue();

        console.log(`testApplicationInfo001 applicationInfo.name: ` + applicationInfo.name);
        expect(applicationInfo.name == 'com.example.uiabilitycontexttest').assertTrue();
        console.log(`testApplicationInfo001 applicationInfo.description: ` + applicationInfo.description.length);
        expect(applicationInfo.description.length >= 0).assertTrue();
        console.log(`testApplicationInfo001 applicationInfo.descriptionId: ` + applicationInfo.descriptionId);
        expect(applicationInfo.descriptionId == 0).assertTrue();
        console.log(`testApplicationInfo001 applicationInfo.label: ` + applicationInfo.label);
        expect(applicationInfo.label == '$string:app_name').assertTrue();
        console.log(`testApplicationInfo001 applicationInfo.labelId: ` + applicationInfo.labelId);
        expect(applicationInfo.labelId != null).assertTrue();
        console.log(`testApplicationInfo001 applicationInfo.icon: ` + applicationInfo.icon);
        expect(applicationInfo.icon == '$media:app_icon').assertTrue();
        console.log(`testApplicationInfo001 applicationInfo.iconId: ` + applicationInfo.iconId);
        expect(applicationInfo.iconId != null).assertTrue();
        console.log(`testApplicationInfo001 applicationInfo.codePath: ` + applicationInfo.codePath);
        expect(typeof (applicationInfo.codePath) == 'string').assertTrue();

        console.log(`testApplicationInfo001 success`);
        done();
      } catch (err) {
        console.log(`testApplicationInfo001 fail: ` + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : ABILITY_TEST_CACHEDIR_0100
     * @tc.name      : testCacheDir001
     * @tc.desc      : test filed of cacheDir
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testCacheDir001', Level.LEVEL0, async (done: Function) => {
      try {
        let context: common.UIAbilityContext = globalThis.abilityContext;
        console.log(`testCacheDir001 cacheDir:` + context.cacheDir);
        expect(typeof (context.cacheDir) == 'string').assertTrue();
        console.log(`testCacheDir001 success`);
        done();
      } catch (err) {
        console.log(`testCacheDir001 fail: ` + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : ABILITY_TEST_TEMPDIR_0100
     * @tc.name      : testTempDir001
     * @tc.desc      : test filed of tempDir
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testTempDir001', Level.LEVEL0, async (done: Function) => {
      try {
        let context: common.UIAbilityContext = globalThis.abilityContext;
        console.log(`testTempDir001 tempDir:` + context.tempDir);
        expect(typeof (context.tempDir) == 'string').assertTrue();
        console.log(`testTempDir001 success`);
        done();
      } catch (err) {
        console.log(`testTempDir001 fail: ` + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : ABILITY_TEST_RESOURCE_DIR_0100
     * @tc.name      : testTempDir001
     * @tc.desc      : test filed of tempDir
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testResourceDir001', Level.LEVEL0, async (done: Function) => {
      try {
        let context: common.UIAbilityContext = globalThis.abilityContext;
        console.log(`testResourceDir001 resourceDir:` + context.resourceDir);
        expect(typeof (context.resourceDir) == 'string').assertTrue();
        console.log(`testResourceDir001 success`);
        done();
      } catch (err) {
        console.log(`testResourceDir001 fail: ` + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : ABILITY_TEST_FILESDIR_0100
     * @tc.name      : testFilesDir001
     * @tc.desc      : test filed of filesDir
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testFilesDir001', Level.LEVEL0, async (done: Function) => {
      try {
        let context: common.UIAbilityContext = globalThis.abilityContext;
        console.log(`testFilesDir001 filesDir:` + context.filesDir);
        expect(typeof (context.filesDir) == 'string').assertTrue();
        console.log(`testFilesDir001 success`);
        done();
      } catch (err) {
        console.log(`testFilesDir001 fail: ` + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : ABILITY_TEST_DATABASEDIR_0100
     * @tc.name      : testDatabaseDir001
     * @tc.desc      : test filed of databaseDir
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testDatabaseDir001', Level.LEVEL0, async (done: Function) => {
      try {
        let context: common.UIAbilityContext = globalThis.abilityContext;
        console.log(`testDatabaseDir001 databaseDir:` + context.databaseDir);
        expect(typeof (context.databaseDir) == 'string').assertTrue();
        console.log(`testDatabaseDir001 success`);
        done();
      } catch (err) {
        console.log(`testDatabaseDir001 fail: ` + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : ABILITY_TEST_PREFERENCESDIR_0100
     * @tc.name      : testPreferencesDir001
     * @tc.desc      : test filed of preferencesDir
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testPreferencesDir001', Level.LEVEL0, async (done: Function) => {
      try {
        let context: common.UIAbilityContext = globalThis.abilityContext;
        console.log(`testPreferencesDir001 preferencesDir:` + context.preferencesDir);
        expect(typeof (context.preferencesDir) == 'string').assertTrue();
        console.log(`testPreferencesDir001 success`);
        done();
      } catch (err) {
        console.log(`testPreferencesDir001 fail: ` + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : ABILITY_TEST_BUNDLECODEDIR_0100
     * @tc.name      : testBundleCodeDir001
     * @tc.desc      : test filed of bundleCodeDir
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testBundleCodeDir001', Level.LEVEL0, async (done: Function) => {
      try {
        let context: common.UIAbilityContext = globalThis.abilityContext;
        console.log(`testBundleCodeDir001 bundleCodeDir:` + context.bundleCodeDir);
        expect(typeof (context.bundleCodeDir) == 'string').assertTrue();
        console.log(`testBundleCodeDir001 success`);
        done();
      } catch (err) {
        console.log(`testBundleCodeDir001 fail: ` + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : ABILITY_TEST_CREATEMODULECONTEXT_0100
     * @tc.name      : testCreateModuleContext001
     * @tc.desc      : Context calls createModuleContext, passing in the moduleName of the current application hap1
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("testCreateModuleContext001", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("testCreateModuleContext001 begin");
        let context: common.UIAbilityContext = globalThis.abilityContext;
        expect(context != null).assertTrue();
        let moduleContext = context.createModuleContext("entryTest");
        expect(moduleContext != null).assertTrue();
        bundleName = moduleContext.applicationInfo.name;
        console.info("testCreateModuleContext001 bundleName: " + bundleName);
        expect(bundleName).assertEqual("com.example.uiabilitycontexttest");
        done();
      } catch (err) {
        console.info("testCreateModuleContext001 err: " + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : ABILITY_TEST_CREATEMODULECONTEXT_002
     * @tc.name      : testCreateModuleContext002
     * @tc.desc      : Context calls createModuleContext, passing in the moduleName of the current application hap2
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("testCreateModuleContext002", Level.LEVEL0, async (done: Function) => {
      try {
        console.log("testCreateModuleContext002 begin");
        let context: common.UIAbilityContext = globalThis.abilityContext;
        expect(context != null).assertTrue();
        let moduleContext = context.createModuleContext("entryTest");
        expect(moduleContext != null).assertTrue();
        bundleName = moduleContext.applicationInfo.name;
        console.info("testCreateModuleContext002 bundleName: " + bundleName);
        expect(bundleName).assertEqual("com.example.uiabilitycontexttest");
        done();
      } catch (err) {
        console.info("testCreateModuleContext002 err: " + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : ABILITY_TEST_CREATEMODULECONTEXT_003
     * @tc.name      : testCreateModuleContext003
     * @tc.desc      : Context calls createModuleContext, passing in the moduleName of the cross-application hap1
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("testCreateModuleContext003", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("testCreateModuleContext003 begin");
        let context: common.UIAbilityContext = globalThis.abilityContext;
        let moduleContext = context.createModuleContext("entryTest_assist");
        expect(!moduleContext).assertTrue();
        done();
      } catch (err) {
        let errLog = "Invalid input parameter"
        console.debug("testCreateModuleContext003 ====>e====>" + err.toString());
        expect(err.toString().indexOf(errLog) >= 0).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : ABILITY_TEST_CREATEMODULECONTEXT_004
     * @tc.name      : testCreateModuleContext004
     * @tc.desc      : Context calls createModuleContext, passing in a non-existing moduleName
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("testCreateModuleContext004", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("testCreateModuleContext004 begin");
        let context: common.UIAbilityContext = globalThis.abilityContext;
        let moduleContext = context.createModuleContext("abc");
        expect(!moduleContext).assertTrue();
        done();
      } catch (err) {
        let errLog = "Invalid input parameter"
        console.debug("testCreateModuleContext004 ====>e====>" + err.toString());
        expect(err.toString().indexOf(errLog) >= 0).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : ABILITY_TEST_CREATEMODULECONTEXT_005
     * @tc.name      : testCreateModuleContext005
     * @tc.desc      : Context calls createModuleContext, and the incoming moduleName is undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("testCreateModuleContext005", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("testCreateModuleContext005 begin");
        let context: common.UIAbilityContext = globalThis.abilityContext;
        let moduleContext = context.createModuleContext(undefined);
        expect(moduleContext != null).assertTrue();
        done();
      } catch (err) {
        let errLog = "Parse param moduleName failed, moduleName must be string."
        console.debug("testCreateModuleContext005 ====>e====>" + err.toString());
        expect(err.toString().indexOf(errLog) >= 0).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : ABILITY_TEST_GETAPPLICATIONCONTEXT_0100
     * @tc.name      : testGetApplicationContext001
     * @tc.desc      : test getApplicationContext return not empty
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("testGetApplicationContext001", Level.LEVEL0, async (done: Function) => {
      try {
        console.info("testGetApplicationContext001 begin");
        let context: common.UIAbilityContext = globalThis.abilityContext;
        let applicationContext = context.getApplicationContext();
        expect(applicationContext != null).assertTrue();
        console.info("testGetApplicationContext001 success");
        done();
      } catch (err) {
        console.log(`testGetApplicationContext001 fail: ` + err);
        expect().assertFail();
        done();
      }
    });
  })
}
