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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';

export default function AbilityStageContext() {
  describe("AbilityStageContext", function () {
    let bundleName: any;

    beforeAll(async function () {
      console.info("beforeAll case");
    });

    beforeEach(async function () {
      console.info("beforeEach case");
    });

    afterEach(async function () {
      console.info('afterEach case');
    });

    afterAll(async function () {
      console.info("afterAll case");
    });

    /**
     * @tc.number    : ABILITY_TEST_ABILITYSTAGECONTEXT_CURRENTHAPMODULEINFO_0100
     * @tc.name      : testAbilityStageContextCurrentHapModuleInfo001
     * @tc.desc      : test filed of currentHapModuleInfo
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testAbilityStageContextCurrentHapModuleInfo001', 0, async function (done) {
      try {
        let context: common.AbilityStageContext = globalThis.stageContext;
        expect(context != null).assertTrue();
        let hapModuleInfo = context.currentHapModuleInfo;
        expect(hapModuleInfo != null).assertTrue();

        console.log(`testAbilityStageContextCurrentHapModuleInfo001 hapModuleInfo.name: ` + hapModuleInfo.name);
        expect(hapModuleInfo.name == "entryTest").assertTrue();
        console.log(`testAbilityStageContextCurrentHapModuleInfo001 hapModuleInfo.icon: ` + hapModuleInfo.icon);
        expect(hapModuleInfo.icon == "$media:icon").assertTrue();
        console.log(`testAbilityStageContextCurrentHapModuleInfo001 hapModuleInfo.iconId: ` + hapModuleInfo.iconId);
        expect(typeof (hapModuleInfo.iconId) == 'number').assertTrue();
        console.log(`testAbilityStageContextCurrentHapModuleInfo001 hapModuleInfo.label: ` + hapModuleInfo.label);
        expect(hapModuleInfo.label == "$string:TestAbility_label").assertTrue();
        console.log(`testAbilityStageContextCurrentHapModuleInfo001 hapModuleInfo.labelId: ` + hapModuleInfo.labelId);
        expect(typeof (hapModuleInfo.labelId) == 'number').assertTrue();
        console.log(`testAbilityStageContextCurrentHapModuleInfo001 hapModuleInfo.description: ` + hapModuleInfo.description);
        expect(hapModuleInfo.description == "$string:module_test_desc").assertTrue();
        console.log(`testAbilityStageContextCurrentHapModuleInfo001 hapModuleInfo.descriptionId: ` + hapModuleInfo.descriptionId);
        expect(typeof (hapModuleInfo.descriptionId) == 'number').assertTrue();
        console.log(`testAbilityStageContextCurrentHapModuleInfo001 hapModuleInfo.mainElementName: ` + hapModuleInfo.mainElementName);
        expect(hapModuleInfo.mainElementName == "TestAbility").assertTrue();
        console.log(`testAbilityStageContextCurrentHapModuleInfo001 hapModuleInfo.metadata: ` + hapModuleInfo.metadata.length);
        expect(hapModuleInfo.metadata.length >= 0).assertTrue();

        console.log(`testAbilityStageContextCurrentHapModuleInfo001 success`);
        done();
      } catch (err) {
        console.log(`testAbilityStageContextCurrentHapModuleInfo001 fail: ` + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : ABILITY_TEST_ABILITYSTAGECONTEXT_CONFIG_0100
     * @tc.name      : testAbilityStageContextConfig001
     * @tc.desc      : test filed of config
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 1
     */
    it('testAbilityStageContextConfig001', 0, async function (done) {
      try {
        let context: common.AbilityStageContext = globalThis.stageContext;
        expect(context != null).assertTrue();
        let config = context.config;
        expect(config != null).assertTrue();

        console.log(`testAbilityStageContextConfig001 config.colorMode: ` + config.colorMode);
        expect(typeof (config.colorMode) == 'number').assertTrue();
        console.log(`testAbilityStageContextConfig001 config.direction: ` + config.direction);
        expect(typeof (config.direction) == 'number').assertTrue();

        console.log(`testAbilityStageContextConfig001 success`);
        done();
      } catch (err) {
        console.log(`testAbilityStageContextConfig001 fail: ` + err);
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
    it('testStageMode001', 0, async function (done) {
      try {
        let context: common.AbilityStageContext = globalThis.stageContext;
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
    it('testResourceManager001', 0, async function (done) {
      try {
        let context: common.AbilityStageContext = globalThis.stageContext;
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
    it('testApplicationInfo001', 0, async function (done) {
      try {
        let context: common.AbilityStageContext = globalThis.stageContext;
        expect(context != null).assertTrue();
        let applicationInfo = context.applicationInfo;
        expect(applicationInfo != null).assertTrue();

        console.log(`testApplicationInfo001 applicationInfo.name: ` + applicationInfo.name);
        expect(applicationInfo.name == 'com.example.contexttest').assertTrue();
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
    it('testCacheDir001', 0, async function (done) {
      try {
        let context: common.AbilityStageContext = globalThis.stageContext;
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
    it('testTempDir001', 0, async function (done) {
      try {
        let context: common.AbilityStageContext = globalThis.stageContext;
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
    it('testResourceDir001', 0, async function (done) {
      try {
        let context: common.AbilityStageContext = globalThis.stageContext;
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
    it('testFilesDir001', 0, async function (done) {
      try {
        let context: common.AbilityStageContext = globalThis.stageContext;
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
    it('testDatabaseDir001', 0, async function (done) {
      try {
        let context: common.AbilityStageContext = globalThis.stageContext;
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
    it('testPreferencesDir001', 0, async function (done) {
      try {
        let context: common.AbilityStageContext = globalThis.stageContext;
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
    it('testBundleCodeDir001', 0, async function (done) {
      try {
        let context: common.AbilityStageContext = globalThis.stageContext;
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
    it("testCreateModuleContext001", 0, async function (done) {
      try {
        console.info("testCreateModuleContext001 begin");
        let context: common.AbilityStageContext = globalThis.stageContext;
        expect(context != null).assertTrue();
        let moduleContext = context.createModuleContext("entry");
        expect(moduleContext != null).assertTrue();
        bundleName = moduleContext.applicationInfo.name;
        console.info("testCreateModuleContext001 bundleName: " + bundleName);
        expect(bundleName).assertEqual("com.example.contexttest");
        done();
      } catch (err) {
        console.info("testCreateModuleContext001 err: " + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : ABILITY_TEST_CREATEMODULECONTEXT_0200
     * @tc.name      : testCreateModuleContext002
     * @tc.desc      : Context calls createModuleContext, passing in the moduleName of the current application hap2
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("testCreateModuleContext002", 0, async function (done) {
      try {
        console.log("testCreateModuleContext002 begin");
        let context: common.AbilityStageContext = globalThis.stageContext;
        expect(context != null).assertTrue();
        let moduleContext = context.createModuleContext("entryTest");
        expect(moduleContext != null).assertTrue();
        bundleName = moduleContext.applicationInfo.name;
        console.info("testCreateModuleContext002 bundleName: " + bundleName);
        expect(bundleName).assertEqual("com.example.contexttest");
        done();
      } catch (err) {
        console.info("testCreateModuleContext002 err: " + err);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.number    : ABILITY_TEST_CREATEMODULECONTEXT_0300
     * @tc.name      : testCreateModuleContext003
     * @tc.desc      : Context calls createModuleContext, passing in the moduleName of the cross-application hap1
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("testCreateModuleContext003", 0, async function (done) {
      try {
        console.info("testCreateModuleContext003 begin");
        let context: common.AbilityStageContext = globalThis.stageContext;
        let moduleContext = context.createModuleContext("entry_assist");
        expect(!moduleContext).assertTrue();
        done();
      } catch (err) {
        let e = err.toString();
        let errLog = "Invalid input parameter"
        console.debug("testCreateModuleContext003 ====>e====>" + e);
        expect(e.indexOf(errLog) >= 0).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : ABILITY_TEST_CREATEMODULECONTEXT_0400
     * @tc.name      : testCreateModuleContext004
     * @tc.desc      : Context calls createModuleContext, passing in a non-existing moduleName
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("testCreateModuleContext004", 0, async function (done) {
      try {
        console.info("testCreateModuleContext004 begin");
        let context: common.AbilityStageContext = globalThis.stageContext;
        let moduleContext = context.createModuleContext("abc");
        expect(!moduleContext).assertTrue();
        done();
      } catch (err) {
        let e = err.toString();
        let errLog = "Invalid input parameter"
        console.debug("testCreateModuleContext004 ====>e====>" + e);
        expect(e.indexOf(errLog) >= 0).assertTrue();
        done();
      }
    })

    /**
     * @tc.number    : ABILITY_TEST_CREATEMODULECONTEXT_0500
     * @tc.name      : testCreateModuleContext005
     * @tc.desc      : Context calls createModuleContext, and the incoming moduleName is undefined
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 2
     */
    it("testCreateModuleContext005", 0, async function (done) {
      try {
        console.info("testCreateModuleContext005 begin");
        let context: common.AbilityStageContext = globalThis.stageContext;
        let moduleContext = context.createModuleContext(undefined);
        expect(moduleContext != null).assertTrue();
        done();
      } catch (err) {
        let e = err.toString();
        let errLog = "Invalid input parameter"
        console.debug("testCreateModuleContext005 ====>e====>" + e);
        expect(e.indexOf(errLog) >= 0).assertTrue();
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
    it("testGetApplicationContext001", 0, async function (done) {
      try {
        console.info("testGetApplicationContext001 begin");
        let context: common.AbilityStageContext = globalThis.stageContext;
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
