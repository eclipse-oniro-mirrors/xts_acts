/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

import { describe, it, expect, Level } from '@ohos/hypium';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';

let createModuleContext:common.Context | null;
let bundleName:string;

export default function actsCreateModuleContextTest() {
  describe("CreateModuleContext", () => {
    /**
     * @tc.name   SUB_AA_CreateModuleContext_0100
     * @tc.number SUB_AA_CreateModuleContext_0100
     * @tc.desc   Verify that the context of the application can be obtained
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_AA_CreateModuleContext_0100", Level.LEVEL0, async (done:Function) => {
      console.info("SUB_AA_AbilityStage_0100 begin");

      createModuleContext = null;

      createModuleContext =
        globalThis.abilityContext.createModuleContext("entry_test");

      bundleName = createModuleContext!.applicationInfo.name;

      expect(bundleName).assertEqual("com.example.createmodulecontexttest");
      done();
    });

    /**
     * @tc.name   SUB_AA_CreateModuleContext_0200
     * @tc.number SUB_AA_CreateModuleContext_0200
     * @tc.desc   Verify that the context of the application can be obtained
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_AA_CreateModuleContext_0200", Level.LEVEL0, async (done:Function) => {
      console.log("SUB_AA_CreateModuleContext_0200 begin");

      createModuleContext = null;

      createModuleContext =
        globalThis.abilityContext.createModuleContext("feature");

      bundleName = createModuleContext!.applicationInfo.name;

      expect(bundleName).assertEqual("com.example.createmodulecontexttest");
      done();
    });

    /**
     * @tc.name   SUB_AA_CreateModuleContext_0300
     * @tc.number SUB_AA_CreateModuleContext_0300
     * @tc.desc   Verify that the context of the application can not be obtained
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_AA_CreateModuleContext_0300", Level.LEVEL0, async (done:Function) => {
      console.info("SUB_AA_CreateModuleContext_0300 begin");

      createModuleContext = null;

      try {
        createModuleContext =
          globalThis.abilityContext.createModuleContext("entry_assist");
      } catch (err) {
        let e:string = err.toString();
        let errLog = "Invalid input parameter"
        console.debug("====>e====>" + e);
        expect(e.indexOf(errLog) >= 0).assertTrue();
      }

      expect(createModuleContext).assertEqual(null);
      done();
    });

    /**
     * @tc.name   SUB_AA_CreateModuleContext_0400
     * @tc.number SUB_AA_CreateModuleContext_0400
     * @tc.desc   Verify that the context of the application can not be obtained
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_AA_CreateModuleContext_0400", Level.LEVEL0, async (done:Function) => {
      console.info("SUB_AA_CreateModuleContext_0400 begin");

      createModuleContext = null;

      try {
        createModuleContext =
          globalThis.abilityContext.createModuleContext("abc");
      } catch (err) {
        let e:string = err.toString();
        let errLog = "Invalid input parameter"
        console.debug("====>e====>" + e);
        expect(e.indexOf(errLog) >= 0).assertTrue();
      }

      expect(createModuleContext).assertEqual(null);
      done();
    });

    /**
     * @tc.name   SUB_AA_CreateModuleContext_0500
     * @tc.number SUB_AA_CreateModuleContext_0500
     * @tc.desc   Verify that the context of the application can not be obtained
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_AA_CreateModuleContext_0500", Level.LEVEL0, async (done:Function) => {
      console.info("SUB_AA_CreateModuleContext_0500 begin");

      createModuleContext = null;

      try {
        createModuleContext =
          globalThis.abilityContext.createModuleContext(undefined);
      } catch (err) {
        let e:string = err.toString();
        let errLog = "Parse param moduleName failed, moduleName must be string."
        console.info("SUB_AA_CreateModuleContext_0500 createModuleContext is " + JSON.stringify(createModuleContext));
        console.debug("====>e====>" + e);
        expect(e.indexOf(errLog) >= 0).assertTrue();
      }

      expect(createModuleContext).assertEqual(null);
      done();
    });

    /**
     * @tc.name   SUB_AA_CreateModuleContext_0600
     * @tc.number SUB_AA_CreateModuleContext_0600
     * @tc.desc   Verify that the context of the application can be obtained
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_AA_CreateModuleContext_0600", Level.LEVEL0, async (done:Function) => {
      console.info("SUB_AA_CreateModuleContext_0600 begin");

      createModuleContext = null;

      createModuleContext =
        globalThis.abilityStageContext.createModuleContext("entry_test");

      bundleName = createModuleContext!.applicationInfo.name;

      expect(bundleName).assertEqual("com.example.createmodulecontexttest");
      done();
    });

    /**
     * @tc.name   SUB_AA_CreateModuleContext_0700
     * @tc.number SUB_AA_CreateModuleContext_0700
     * @tc.desc   Verify that the context of the application can be obtained
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_AA_CreateModuleContext_0700", Level.LEVEL0, async (done:Function) => {
      console.info("SUB_AA_CreateModuleContext_0700 begin");

      createModuleContext = null;

      createModuleContext =
        globalThis.abilityStageContext.createModuleContext("feature");

      bundleName = createModuleContext!.applicationInfo.name;

      expect(bundleName).assertEqual("com.example.createmodulecontexttest");
      done();
    });

    /**
     * @tc.name   SUB_AA_CreateModuleContext_0800
     * @tc.number SUB_AA_CreateModuleContext_0800
     * @tc.desc   Verify that the context of the application can not be obtained
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_AA_CreateModuleContext_0800", Level.LEVEL0, async (done:Function) => {
      console.info("SUB_AA_CreateModuleContext_0800 begin");

      createModuleContext = null;

      try {
        createModuleContext =
          globalThis.abilityContext.createModuleContext("entry_assist");
      } catch (err) {
        let e:string = err.toString();
        let errLog = "Invalid input parameter"
        console.debug("====>e====>" + e);
        expect(e.indexOf(errLog) >= 0).assertTrue();
      }

      expect(createModuleContext).assertEqual(null);
      done();
    });

    /**
     * @tc.name   SUB_AA_CreateModuleContext_0900
     * @tc.number SUB_AA_CreateModuleContext_0900
     * @tc.desc   Verify that the context of the application can not be obtained
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_AA_CreateModuleContext_0900", Level.LEVEL0, async (done:Function) => {
      console.info("SUB_AA_CreateModuleContext_0900 begin");

      createModuleContext = null;

      try {
        createModuleContext =
          globalThis.abilityContext.createModuleContext("createmodue");
      } catch (err) {
        let e:string = err.toString();
        let errLog = "Invalid input parameter"
        console.debug("====>e====>" + e);
        expect(e.indexOf(errLog) >= 0).assertTrue();
      }

      expect(createModuleContext).assertEqual(null);
      done();
    });

    /**
     * @tc.name   SUB_AA_CreateModuleContext_1000
     * @tc.number SUB_AA_CreateModuleContext_1000
     * @tc.desc   Verify that the context of the application can not be obtained
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_AA_CreateModuleContext_1000", Level.LEVEL0, async (done:Function) => {
      console.info("SUB_AA_CreateModuleContext_1000 begin");

      createModuleContext = null;

      try {
        createModuleContext =
          globalThis.abilityStageContext.createModuleContext(undefined);
      } catch (err) {
        let e:string = err.toString();
        let errLog = "Parse param moduleName failed, moduleName must be string."
        console.info("SUB_AA_CreateModuleContext_1000 createModuleContext is " + JSON.stringify(createModuleContext));
        console.debug("====>e====>" + e);
        expect(e.indexOf(errLog) >= 0).assertTrue();
      }

      expect(createModuleContext).assertEqual(null);
      done();
    });
  });
}
