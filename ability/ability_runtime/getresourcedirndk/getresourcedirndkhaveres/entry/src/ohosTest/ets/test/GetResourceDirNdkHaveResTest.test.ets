/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { hilog } from '@kit.PerformanceAnalysisKit';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';

import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import testNapi from 'libentry.so';
import { fileIo } from '@kit.CoreFileKit';

let applicationContext = abilityDelegatorRegistry.getAbilityDelegator().getAppContext().getApplicationContext();
export default function getResourceDirNdkHaveResTest() {
  describe('ActsGetResourceDirNdkHaveResTest', () => {
    beforeAll(() => {
    })
    beforeEach(() => {
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_GetResourceDirNdk_0100
     * @tc.name: SUB_Ability_AbilityRuntime_GetResourceDirNdk_0100
     * @tc.desc: Obtain the resource path of the entry module (with resource files)
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 3
     */
    it('SUB_Ability_AbilityRuntime_GetResourceDirNdk_0100', Level.LEVEL3, (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_GetResourceDirNdk_0100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let moduleName : string = 'entry';
      let res = testNapi.getResourceDir(moduleName);
      let resCode = res[0];
      let resPath = res[1];
      expect(resCode).assertEqual(0);
      expect(resPath).assertEqual('/data/storage/el1/bundle/entry/resources/resfile');
      expect(fileIo.accessSync(resPath + '/element/test.json', 4)).assertEqual(true);
      try{
        expect(fileIo.accessSync(resPath + '/element/test.json', 2)).assertEqual(false);
      } catch (err) {
        hilog.info(0x0000, 'testTag', 'write data to file failed! error message: %{public}s, error code: %{public}d',
          err.message, err.code);
        expect(err.code).assertEqual(13900012);
      }
      done();
    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_GetResourceDirNdk_0200
     * @tc.name: SUB_Ability_AbilityRuntime_GetResourceDirNdk_0200
     * @tc.desc: Obtain the resource path of the feature module (with resource files)
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 3
     */
    it('SUB_Ability_AbilityRuntime_GetResourceDirNdk_0200', Level.LEVEL3, (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_GetResourceDirNdk_0200';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let moduleName : string = 'feature';
      let res = testNapi.getResourceDir(moduleName);
      let resCode = res[0];
      let resPath = res[1];
      expect(resCode).assertEqual(0);
      expect(resPath).assertEqual('/data/storage/el1/bundle/feature/resources/resfile');
      expect(fileIo.accessSync(resPath + '/element/testfeature.json', 4)).assertEqual(true);
      try{
        expect(fileIo.accessSync(resPath + '/element/testfeature.json', 2)).assertEqual(false);
      } catch (err) {
        hilog.info(0x0000, 'testTag', 'write data to file failed! error message: %{public}s, error code: %{public}d',
          err.message, err.code);
        expect(err.code).assertEqual(13900012);
      }
      done();
    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_GetResourceDirNdk_0300
     * @tc.name: SUB_Ability_AbilityRuntime_GetResourceDirNdk_0300
     * @tc.desc: Obtain the resource path of the shared module (with resource files)
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 3
     */
    it('SUB_Ability_AbilityRuntime_GetResourceDirNdk_0300', Level.LEVEL3, (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_GetResourceDirNdk_0300';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let moduleName : string = 'shared';
      let res = testNapi.getResourceDir(moduleName);
      let resCode = res[0];
      let resPath = res[1];
      expect(resCode).assertEqual(0);
      expect(resPath).assertEqual('/data/storage/el1/bundle/shared/resources/resfile');
      expect(fileIo.accessSync(resPath + '/element/testhsp.json', 4)).assertEqual(true);
      try{
        expect(fileIo.accessSync(resPath + '/element/testhsp.json', 2)).assertEqual(false);
      } catch (err) {
        hilog.info(0x0000, 'testTag', 'write data to file failed! error message: %{public}s, error code: %{public}d',
          err.message, err.code);
        expect(err.code).assertEqual(13900012);
      }
      done();
    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_GetResourceDirNdk_0400
     * @tc.name: SUB_Ability_AbilityRuntime_GetResourceDirNdk_0400
     * @tc.desc: Obtain the resource path of the application module (the dependent har has resource files)
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 3
     */
    it('SUB_Ability_AbilityRuntime_GetResourceDirNdk_0400', Level.LEVEL3, (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_GetResourceDirNdk_0400';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let moduleName : string = 'application';
      let res = testNapi.getResourceDir(moduleName);
      let resCode = res[0];
      let resPath = res[1];
      expect(resCode).assertEqual(0);
      expect(resPath).assertEqual('/data/storage/el1/bundle/application/resources/resfile');
      expect(fileIo.accessSync(resPath + '/element/testhar.json', 4)).assertEqual(true);
      try{
        expect(fileIo.accessSync(resPath + '/element/testhar.json', 2)).assertEqual(false);
      } catch (err) {
        hilog.info(0x0000, 'testTag', 'write data to file failed! error message: %{public}s, error code: %{public}d',
          err.message, err.code);
        expect(err.code).assertEqual(13900012);
      }
      done();
    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_GetResourceDirNdk_0500
     * @tc.name: SUB_Ability_AbilityRuntime_GetResourceDirNdk_0500
     * @tc.desc: Obtain the resource path of the non-existent module (the dependent har has resource files)
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 3
     */
    it('SUB_Ability_AbilityRuntime_GetResourceDirNdk_0500', Level.LEVEL3, (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_GetResourceDirNdk_0500';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let moduleName : string = 'test';
      let res = testNapi.getResourceDir(moduleName);
      let resCode = res[0];
      expect(resCode).assertEqual(401);
      done();
    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_GetResourceDirNdk_0600
     * @tc.name: SUB_Ability_AbilityRuntime_GetResourceDirNdk_0600
     * @tc.desc: Stability test
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 3
     */
    it('SUB_Ability_AbilityRuntime_GetResourceDirNdk_0600', Level.LEVEL3, (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_GetResourceDirNdk_0600';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let moduleName : string = 'entry';
      for (let i = 0; i < 1000; i++) {
        let res = testNapi.getResourceDir(moduleName);
        let resCode = res[0];
        let resPath = res[1];
        expect(resCode).assertEqual(0);
        expect(resPath).assertEqual('/data/storage/el1/bundle/entry/resources/resfile');
      }
      done();
    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_GetResourceDirNdk_0700
     * @tc.name: SUB_Ability_AbilityRuntime_GetResourceDirNdk_0700
     * @tc.desc: Empty ModuleName
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 3
     */
    it('SUB_Ability_AbilityRuntime_GetResourceDirNdk_0700', Level.LEVEL3, (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_GetResourceDirNdk_0700';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let moduleName : string = '';
      let res = testNapi.getResourceDir(moduleName);
      let resCode = res[0];
      expect(resCode).assertEqual(401);
      done();
    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_GetResourceDirNdk_0800
     * @tc.name: SUB_Ability_AbilityRuntime_GetResourceDirNdk_0800
     * @tc.desc: moduleName is nullptr
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 3
     */
    it('SUB_Ability_AbilityRuntime_GetResourceDirNdk_0800', Level.LEVEL3, (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_GetResourceDirNdk_0800';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let res = testNapi.error_moduleName_null();
      expect(res).assertEqual(401);
      done();
    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_GetResourceDirNdk_0900
     * @tc.name: SUB_Ability_AbilityRuntime_GetResourceDirNdk_0900
     * @tc.desc: writeLength is nullptr
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 3
     */
    it('SUB_Ability_AbilityRuntime_GetResourceDirNdk_0900', Level.LEVEL3, (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_GetResourceDirNdk_0900';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let moduleName : string = 'entry';
      let res = testNapi.error_writelength_null(moduleName);
      expect(res).assertEqual(401);
      done();
    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_GetResourceDirNdk_1000
     * @tc.name: SUB_Ability_AbilityRuntime_GetResourceDirNdk_1000
     * @tc.desc: buffer size less
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 3
     */
    it('SUB_Ability_AbilityRuntime_GetResourceDirNdk_1000', Level.LEVEL3, (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_GetResourceDirNdk_1000';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let moduleName : string = 'entry';
      let res = testNapi.error_buffersize_less(moduleName);
      expect(res).assertEqual(401);
      done();
    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_GetResourceDirNdk_1100
     * @tc.name: SUB_Ability_AbilityRuntime_GetResourceDirNdk_1100
     * @tc.desc: buffer is nullptr
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 3
     */
    it('SUB_Ability_AbilityRuntime_GetResourceDirNdk_1100', Level.LEVEL3, (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_GetResourceDirNdk_1100';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let moduleName : string = 'entry';
      let res = testNapi.error_buffer_null(moduleName);
      expect(res).assertEqual(401);
      done();
    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_GetResourceDirNdk_1200
     * @tc.name: SUB_Ability_AbilityRuntime_GetResourceDirNdk_1200
     * @tc.desc: buffer size larger
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 3
     */
    it('SUB_Ability_AbilityRuntime_GetResourceDirNdk_1200', Level.LEVEL3, (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_GetResourceDirNdk_1200';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let moduleName : string = 'entry';
      let res = testNapi.buffersize_larger(moduleName);
      let resCode = res[0];
      let resPath = res[1];
      expect(resCode).assertEqual(0);
      expect(resPath).assertEqual('/data/storage/el1/bundle/entry/resources/resfile');
      done();
    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_GetResourceDirNdk_1300
     * @tc.name: SUB_Ability_AbilityRuntime_GetResourceDirNdk_1300
     * @tc.desc: buffer size equals
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 3
     */
    it('SUB_Ability_AbilityRuntime_GetResourceDirNdk_1300', Level.LEVEL3, (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_GetResourceDirNdk_1300';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let moduleName : string = 'entry';
      let res = testNapi.buffersize_equals(moduleName);
      expect(res).assertEqual(401);
      done();
    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_GetResourceDirNdk_1400
     * @tc.name: SUB_Ability_AbilityRuntime_GetResourceDirNdk_1400
     * @tc.desc: Compare the resource paths of the entry module obtained through the NDK interface and the JS interface. (with resource files)
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 3
     */
    it('SUB_Ability_AbilityRuntime_GetResourceDirNdk_1400', Level.LEVEL3, (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_GetResourceDirNdk_1400';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let moduleName : string = 'entry';
      let res = testNapi.getResourceDir(moduleName);
      let resCode = res[0];
      let resPath = res[1];
      expect(resCode).assertEqual(0);
      expect(resPath).assertEqual('/data/storage/el1/bundle/entry/resources/resfile');
    
      let moduleContext = applicationContext.createModuleContext('entry');
      let jsResPath = moduleContext.resourceDir;
      expect(resPath).assertEqual(jsResPath);
      done();
    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_GetResourceDirNdk_1500
     * @tc.name: SUB_Ability_AbilityRuntime_GetResourceDirNdk_1500
     * @tc.desc: Compare the resource paths of the feature module obtained through the NDK interface and the JS interface. (with resource files)
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 3
     */
    it('SUB_Ability_AbilityRuntime_GetResourceDirNdk_1500', Level.LEVEL3, (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_GetResourceDirNdk_1500';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let moduleName : string = 'feature';
      let res = testNapi.getResourceDir(moduleName);
      let resCode = res[0];
      let resPath = res[1];
      expect(resCode).assertEqual(0);
      expect(resPath).assertEqual('/data/storage/el1/bundle/feature/resources/resfile');
    
      let moduleContext = applicationContext.createModuleContext('feature');
      let jsResPath = moduleContext.resourceDir;
      expect(resPath).assertEqual(jsResPath);
      done();
    })

    /*
     * @tc.number: SUB_Ability_AbilityRuntime_GetResourceDirNdk_1600
     * @tc.name: SUB_Ability_AbilityRuntime_GetResourceDirNdk_1600
     * @tc.desc: Compare the resource paths of the shared module obtained through the NDK interface and the JS interface. (with resource files)
     * @tc.size: MediumTest
     * @tc.type: Function
     * @tc.level Level 3
     */
    it('SUB_Ability_AbilityRuntime_GetResourceDirNdk_1600', Level.LEVEL3, (done: Function) => {
      let tag = 'SUB_Ability_AbilityRuntime_GetResourceDirNdk_1600';
      hilog.info(0x0000, 'testTag', '%{public}s begin', tag);
      let moduleName : string = 'shared';
      let res = testNapi.getResourceDir(moduleName);
      let resCode = res[0];
      let resPath = res[1];
      expect(resCode).assertEqual(0);
      expect(resPath).assertEqual('/data/storage/el1/bundle/shared/resources/resfile');
    
      let moduleContext = applicationContext.createModuleContext('shared');
      let jsResPath = moduleContext.resourceDir;
      expect(resPath).assertEqual(jsResPath);
      done();
    })
  })
}