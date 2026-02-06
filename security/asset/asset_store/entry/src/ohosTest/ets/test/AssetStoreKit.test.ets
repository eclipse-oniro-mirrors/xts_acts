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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, TestType, Size, Level } from '@ohos/hypium';

import asset from '@ohos.security.asset';
import AssetStore from 'libassetstoretest.so';
import * as ass from './AssetStoreUtil.test'

export default function AssetStoreKitTest() {
  describe('AssetStoreKitTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      AssetStore.Asset_RemoveAll();
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number   SUB_Security_DataSecurity_AssetStore_AssetAdd_Test_0100
     * @tc.name     SUB_Security_DataSecurity_AssetStore_AssetAdd_Test_0100
     * @tc.desc     test error cases
     * @tc.size     Medium
     * @tc.type     Func
     * @tc.level    Level3
     */
    it('SUB_Security_DataSecurity_AssetStore_AssetAdd_Test_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        let caseName: string = 'SUB_Security_DataSecurity_AssetStore_AssetAdd_Test_0100';
        try {
          console.info(`${caseName} ---start`);
          let result: number = AssetStore.Asset_Add(ass.aliasLong, ass.secLong);
          console.info(`${caseName} result is: ` + JSON.stringify(result));
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error(`${caseName} catch err: ` + JSON.stringify(err));
          expect(false).assertEqual(true);
        }
      })

    /**
     * @tc.number   SUB_Security_DataSecurity_AssetStore_AssetAdd_Test_0200
     * @tc.name     SUB_Security_DataSecurity_AssetStore_AssetAdd_Test_0200
     * @tc.desc     test error cases
     * @tc.size     Medium
     * @tc.type     Func
     * @tc.level    Level3
     */
    it('SUB_Security_DataSecurity_AssetStore_AssetAdd_Test_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        let caseName: string = 'SUB_Security_DataSecurity_AssetStore_AssetAdd_Test_0200';
        try {
          console.info(`${caseName} ---start`);
          let result: number = AssetStore.Asset_Add(ass.aliasNameList[1], ass.secLong);
          result = AssetStore.Asset_Add(ass.aliasNameList[1], ass.secLong);
          console.info(`${caseName} result is: ` + JSON.stringify(result));
          expect(result).assertEqual(24000003);
          done();
        } catch (err) {
          console.error(`${caseName} catch err: ` + JSON.stringify(err));
          expect(false).assertEqual(true);
        }
      })

    /**
     * @tc.number   SUB_Security_DataSecurity_AssetStore_AssetAdd_Test_0300
     * @tc.name     SUB_Security_DataSecurity_AssetStore_AssetAdd_Test_0300
     * @tc.desc     test error cases
     * @tc.size     Medium
     * @tc.type     Func
     * @tc.level    Level3
     */
    it('SUB_Security_DataSecurity_AssetStore_AssetAdd_Test_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        let caseName: string = 'SUB_Security_DataSecurity_AssetStore_AssetAdd_Test_0300';
        try {
          console.info(`${caseName} ---start`);
          let result: number = AssetStore.Asset_Add('', '');
          console.info(`${caseName} result is: ` + JSON.stringify(result));
          expect(result).assertEqual(401);
          done();
        } catch (err) {
          console.error(`${caseName} catch err: ` + JSON.stringify(err));
          expect(false).assertEqual(true);
        }
      })

    /**
     * @tc.number   SUB_Security_DataSecurity_AssetStore_AssetAdd_Test_0400
     * @tc.name     SUB_Security_DataSecurity_AssetStore_AssetAdd_Test_0400
     * @tc.desc     test error cases
     * @tc.size     Medium
     * @tc.type     Func
     * @tc.level    Level3
     */
    it('SUB_Security_DataSecurity_AssetStore_AssetAdd_Test_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        let caseName: string = 'SUB_Security_DataSecurity_AssetStore_AssetAdd_Test_0400';
        try {
          console.info(`${caseName} ---start`);
          let result: number = AssetStore.Asset_CoverTag(6);
          console.info(`${caseName} result is: ` + JSON.stringify(result));
          expect(result).assertEqual(201);
          done();
        } catch (err) {
          console.error(`${caseName} catch err: ` + JSON.stringify(err));
          expect(false).assertEqual(true);
        }
      })

    /**
     * @tc.number   SUB_Security_DataSecurity_AssetStore_AssetAdd_Test_0500
     * @tc.name     SUB_Security_DataSecurity_AssetStore_AssetAdd_Test_0500
     * @tc.desc     test error cases
     * @tc.size     Medium
     * @tc.type     Func
     * @tc.level    Level3
     */
    it('SUB_Security_DataSecurity_AssetStore_AssetAdd_Test_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        let caseName: string = 'SUB_Security_DataSecurity_AssetStore_AssetAdd_Test_0500';
        try {
          console.info(`${caseName} ---start`);
          let result: number = AssetStore.Asset_IPCErr();
          console.info(`${caseName} result is: ` + JSON.stringify(result));
          expect(result).assertEqual(24000010);
          done();
        } catch (err) {
          console.error(`${caseName} catch err: ` + JSON.stringify(err));
          expect(false).assertEqual(true);
        }
      })

    /**
     * @tc.number   SUB_Security_DataSecurity_AssetStore_AssetRemove_Test_0100
     * @tc.name     SUB_Security_DataSecurity_AssetStore_AssetRemove_Test_0100
     * @tc.desc     test error cases
     * @tc.size     Medium
     * @tc.type     Func
     * @tc.level    Level3
     */
    it('SUB_Security_DataSecurity_AssetStore_AssetRemove_Test_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        let caseName: string = 'SUB_Security_DataSecurity_AssetStore_AssetRemove_Test_0100';
        try {
          console.info(`${caseName} ---start`);
          let attr: asset.AssetMap = new Map();
          await ass.assetAddAll(attr);
          let result: number = AssetStore.Asset_Remove(0, ass.aliasNameList[0]);
          console.info(`${caseName} result is: ` + JSON.stringify(result));
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error(`${caseName} catch err: ` + JSON.stringify(err));
          expect(false).assertEqual(true);
        }
      })

    /**
     * @tc.number   SUB_Security_DataSecurity_AssetStore_AssetRemove_Test_0200
     * @tc.name     SUB_Security_DataSecurity_AssetStore_AssetRemove_Test_0200
     * @tc.desc     test error cases
     * @tc.size     Medium
     * @tc.type     Func
     * @tc.level    Level3
     */
    it('SUB_Security_DataSecurity_AssetStore_AssetRemove_Test_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        let caseName: string = 'SUB_Security_DataSecurity_AssetStore_AssetRemove_Test_0200';
        try {
          console.info(`${caseName} ---start`);
          let attr: asset.AssetMap = new Map();
          await ass.assetAddAll(attr);
          let result: number = AssetStore.Asset_Remove(1, "test");
          console.info(`${caseName} result is: ` + JSON.stringify(result));
          expect(result).assertEqual(24000002);
          done();
        } catch (err) {
          console.error(`${caseName} catch err: ` + JSON.stringify(err));
          expect(false).assertEqual(true);
        }
      })

    /**
     * @tc.number   SUB_Security_DataSecurity_AssetStore_AssetRemove_Test_0300
     * @tc.name     SUB_Security_DataSecurity_AssetStore_AssetRemove_Test_0300
     * @tc.desc     test error cases
     * @tc.size     Medium
     * @tc.type     Func
     * @tc.level    Level3
     */
    it('SUB_Security_DataSecurity_AssetStore_AssetRemove_Test_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        let caseName: string = 'SUB_Security_DataSecurity_AssetStore_AssetRemove_Test_0300';
        try {
          console.info(`${caseName} ---start`);
          let attr: asset.AssetMap = new Map();
          await ass.assetAddAll(attr);
          let result: number = AssetStore.Asset_Remove(2, "test");
          console.info(`${caseName} result is: ` + JSON.stringify(result));
          expect(result).assertEqual(401);
          done();
        } catch (err) {
          console.error(`${caseName} catch err: ` + JSON.stringify(err));
          expect(false).assertEqual(true);
        }
      })

    /**
     * @tc.number   SUB_Security_DataSecurity_AssetStore_Asset_Update_Test_0100
     * @tc.name     SUB_Security_DataSecurity_AssetStore_Asset_Update_Test_0100
     * @tc.desc     test error cases
     * @tc.size     Medium
     * @tc.type     Func
     * @tc.level    Level3
     */
    it('SUB_Security_DataSecurity_AssetStore_Asset_Update_Test_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
        let caseName: string = 'SUB_Security_DataSecurity_AssetStore_Asset_Update_Test_0100';
        try {
          console.info(`${caseName} ---start`);
          let attr: asset.AssetMap = new Map();
          await ass.assetAddAll(attr);
          let result: number = AssetStore.Asset_Update(ass.aliasNameList[0], ass.secLong);
          console.info(`${caseName} result is: ` + JSON.stringify(result));
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error(`${caseName} catch err: ` + JSON.stringify(err));
          expect(false).assertEqual(true);
        }
      })

    /**
     * @tc.number   SUB_Security_DataSecurity_AssetStore_Asset_Update_Test_0200
     * @tc.name     SUB_Security_DataSecurity_AssetStore_Asset_Update_Test_0200
     * @tc.desc     test error cases
     * @tc.size     Medium
     * @tc.type     Func
     * @tc.level    Level3
     */
    it('SUB_Security_DataSecurity_AssetStore_Asset_Update_Test_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
        let caseName: string = 'SUB_Security_DataSecurity_AssetStore_Asset_Update_Test_0200';
        try {
          console.info(`${caseName} ---start`);
          let attr: asset.AssetMap = new Map();
          await ass.assetAddAll(attr);
          let result: number = AssetStore.Asset_Update('', '');
          console.info(`${caseName} result is: ` + JSON.stringify(result));
          expect(result).assertEqual(401);
          done();
        } catch (err) {
          console.error(`${caseName} catch err: ` + JSON.stringify(err));
          expect(false).assertEqual(true);
        }
      })

    /**
     * @tc.number   SUB_Security_DataSecurity_AssetStore_Asset_Update_Test_0300
     * @tc.name     SUB_Security_DataSecurity_AssetStore_Asset_Update_Test_0300
     * @tc.desc     test error cases
     * @tc.size     Medium
     * @tc.type     Func
     * @tc.level    Level3
     */
    it('SUB_Security_DataSecurity_AssetStore_Asset_Update_Test_0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
        let caseName: string = 'SUB_Security_DataSecurity_AssetStore_Asset_Update_Test_0300';
        try {
          console.info(`${caseName} ---start`);
          let attr: asset.AssetMap = new Map();
          await ass.assetAddAll(attr);
          let result: number = AssetStore.Asset_Update("test", "test");
          console.info(`${caseName} result is: ` + JSON.stringify(result));
          expect(result).assertEqual(24000002);
          done();
        } catch (err) {
          console.error(`${caseName} catch err: ` + JSON.stringify(err));
          expect(false).assertEqual(true);
        }
      })

    /**
     * @tc.number   SUB_Security_DataSecurity_AssetStore_Asset_Query_Test_0100
     * @tc.name     SUB_Security_DataSecurity_AssetStore_Asset_Query_Test_0100
     * @tc.desc     test ASSET_NOT_FOUND error cases
     * @tc.size     Medium
     * @tc.type     Func
     * @tc.level    Level3
     */
    it('SUB_Security_DataSecurity_AssetStore_Asset_Query_Test_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        let caseName: string = 'SUB_Security_DataSecurity_AssetStore_Asset_Query_Test_0100';
        try {
          console.info(`${caseName} ---start`);
          let attr: asset.AssetMap = new Map();
          await ass.assetAddAll(attr);
          let result: number = AssetStore.Asset_Query("test", "test");
          console.info(`${caseName} result is: ` + JSON.stringify(result));
          expect(result).assertEqual(24000002);
          done();
        } catch (err) {
          console.error(`${caseName} catch err: ` + JSON.stringify(err));
          expect(false).assertEqual(true);
        }
      })

    /**
     * @tc.number   SUB_Security_DataSecurity_AssetStore_Asset_TagType_Test_0100
     * @tc.name     SUB_Security_DataSecurity_AssetStore_Asset_TagType_Test_0100
     * @tc.desc     test error cases
     * @tc.size     Medium
     * @tc.type     Func
     * @tc.level    Level3
     */
    it('SUB_Security_DataSecurity_AssetStore_Asset_TagType_Test_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
        let caseName: string = 'SUB_Security_DataSecurity_AssetStore_Asset_TagType_Test_0100';
        try {
          console.info(`${caseName} ---start`);
          let result: number = AssetStore.Asset_CoverTagType(ass.aliasLong, ass.secLong);
          console.info(`${caseName} result is: ` + JSON.stringify(result));
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error(`${caseName} catch err: ` + JSON.stringify(err));
          expect(false).assertEqual(true);
        }
      })

    /**
     * @tc.number   SUB_Security_DataSecurity_AssetStore_Asset_TagType_Test_0200
     * @tc.name     SUB_Security_DataSecurity_AssetStore_Asset_TagType_Test_0200
     * @tc.desc     test error cases
     * @tc.size     Medium
     * @tc.type     Func
     * @tc.level    Level3
     */
    it('SUB_Security_DataSecurity_AssetStore_Asset_TagType_Test_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
        let caseName: string = 'SUB_Security_DataSecurity_AssetStore_Asset_TagType_Test_0200';
        try {
          console.info(`${caseName} ---start`);
          let result: number = AssetStore.Asset_CoverTagType(ass.aliasLong, ass.secLong);
          console.info(`${caseName} result is: ` + JSON.stringify(result));
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error(`${caseName} catch err: ` + JSON.stringify(err));
          expect(false).assertEqual(true);
        }
      })

    /**
     * @tc.number   SUB_Security_DataSecurity_AssetStore_Asset_TagType_Test_0300
     * @tc.name     SUB_Security_DataSecurity_AssetStore_Asset_TagType_Test_0300
     * @tc.desc     test error cases
     * @tc.size     Medium
     * @tc.type     Func
     * @tc.level    Level3
     */
    it('SUB_Security_DataSecurity_AssetStore_Asset_TagType_Test_0300',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
        let caseName: string = 'SUB_Security_DataSecurity_AssetStore_Asset_TagType_Test_0300';
        try {
          console.info(`${caseName} ---start`);
          let result: number = AssetStore.Asset_CoverTagType(ass.aliasLong, ass.secLong);
          console.info(`${caseName} result is: ` + JSON.stringify(result));
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error(`${caseName} catch err: ` + JSON.stringify(err));
          expect(false).assertEqual(true);
        }
      })

    /**
     * @tc.number   SUB_Security_DataSecurity_AssetStore_Asset_Tag_Test_0100
     * @tc.name     SUB_Security_DataSecurity_AssetStore_Asset_Tag_Test_0100
     * @tc.desc     test error cases
     * @tc.size     Medium
     * @tc.type     Func
     * @tc.level    Level3
     */
    it('SUB_Security_DataSecurity_AssetStore_Asset_Tag_Test_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        let caseName: string = 'SUB_Security_DataSecurity_AssetStore_Asset_Tag_Test_0100';
        try {
          console.info(`${caseName} ---start`);
          let result: number = AssetStore.Asset_CoverTag(3);
          console.info(`${caseName} result is: ` + JSON.stringify(result));
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error(`${caseName} catch err: ` + JSON.stringify(err));
          expect(false).assertEqual(true);
        }
      })

    /**
     * @tc.number   SUB_Security_DataSecurity_AssetStore_Asset_Tag_Test_0200
     * @tc.name     SUB_Security_DataSecurity_AssetStore_Asset_Tag_Test_0200
     * @tc.desc     test error cases
     * @tc.size     Medium
     * @tc.type     Func
     * @tc.level    Level3
     */
    it('SUB_Security_DataSecurity_AssetStore_Asset_Tag_Test_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        let caseName: string = 'SUB_Security_DataSecurity_AssetStore_Asset_Tag_Test_0200';
        try {
          console.info(`${caseName} ---start`);
          let result: number = AssetStore.Asset_CoverTag(4);
          console.info(`${caseName} result is: ` + JSON.stringify(result));
          expect(result).assertEqual(401);
          done();
        } catch (err) {
          console.error(`${caseName} catch err: ` + JSON.stringify(err));
          expect(false).assertEqual(true);
        }
      })

    /**
     * @tc.number   SUB_Security_DataSecurity_AssetStore_Asset_Tag_Test_0300
     * @tc.name     SUB_Security_DataSecurity_AssetStore_Asset_Tag_Test_0300
     * @tc.desc     test error cases
     * @tc.size     Medium
     * @tc.type     Func
     * @tc.level    Level3
     */
    it('SUB_Security_DataSecurity_AssetStore_Asset_Tag_Test_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        let caseName: string = 'SUB_Security_DataSecurity_AssetStore_Asset_Tag_Test_0300';
        try {
          console.info(`${caseName} ---start`);
          let result: number = AssetStore.Asset_CoverTag(5);
          console.info(`${caseName} result is: ` + JSON.stringify(result));
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error(`${caseName} catch err: ` + JSON.stringify(err));
          expect(false).assertEqual(true);
        }
      })

    /**
     * @tc.number   SUB_Security_DataSecurity_AssetStore_Asset_Tag_Test_0400
     * @tc.name     SUB_Security_DataSecurity_AssetStore_Asset_Tag_Test_0400
     * @tc.desc     test error cases
     * @tc.size     Medium
     * @tc.type     Func
     * @tc.level    Level3
     */
    it('SUB_Security_DataSecurity_AssetStore_Asset_Tag_Test_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        let caseName: string = 'SUB_Security_DataSecurity_AssetStore_Asset_Tag_Test_0400';
        try {
          console.info(`${caseName} ---start`);
          let result: number = AssetStore.Asset_CoverTag(6);
          console.info(`${caseName} result is: ` + JSON.stringify(result));
          expect(result).assertEqual(201);
          done();
        } catch (err) {
          console.error(`${caseName} catch err: ` + JSON.stringify(err));
          expect(false).assertEqual(true);
        }
      })

    /**
     * @tc.number   SUB_Security_DataSecurity_AssetStore_Asset_Tag_Test_0500
     * @tc.name     SUB_Security_DataSecurity_AssetStore_Asset_Tag_Test_0500
     * @tc.desc     test error cases
     * @tc.size     Medium
     * @tc.type     Func
     * @tc.level    Level3
     */
    it('SUB_Security_DataSecurity_AssetStore_Asset_Tag_Test_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        let caseName: string = 'SUB_Security_DataSecurity_AssetStore_Asset_Tag_Test_0500';
        try {
          console.info(`${caseName} ---start`);
          let result: number = AssetStore.Asset_CoverTag(7);
          console.info(`${caseName} result is: ` + JSON.stringify(result));
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error(`${caseName} catch err: ` + JSON.stringify(err));
          expect(false).assertEqual(true);
        }
      })

    /**
     * @tc.number   SUB_Security_DataSecurity_AssetStore_Asset_Tag_Test_0600
     * @tc.name     SUB_Security_DataSecurity_AssetStore_Asset_Tag_Test_0600
     * @tc.desc     test error cases
     * @tc.size     Medium
     * @tc.type     Func
     * @tc.level    Level3
     */
    it('SUB_Security_DataSecurity_AssetStore_Asset_Tag_Test_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        let caseName: string = 'SUB_Security_DataSecurity_AssetStore_Asset_Tag_Test_0600';
        try {
          console.info(`${caseName} ---start`);
          let result: number = AssetStore.Asset_CoverTag(8);
          console.info(`${caseName} result is: ` + JSON.stringify(result));
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error(`${caseName} catch err: ` + JSON.stringify(err));
          expect(false).assertEqual(true);
        }
      })

    /**
     * @tc.number   SUB_Security_DataSecurity_AssetStore_Asset_Tag_Test_0700
     * @tc.name     SUB_Security_DataSecurity_AssetStore_Asset_Tag_Test_0700
     * @tc.desc     test error cases
     * @tc.size     Medium
     * @tc.type     Func
     * @tc.level    Level3
     */
    it('SUB_Security_DataSecurity_AssetStore_Asset_Tag_Test_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        let caseName: string = 'SUB_Security_DataSecurity_AssetStore_Asset_Tag_Test_0700';
        try {
          console.info(`${caseName} ---start`);
          let result: number = AssetStore.Asset_CoverTag(9);
          console.info(`${caseName} result is: ` + JSON.stringify(result));
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error(`${caseName} catch err: ` + JSON.stringify(err));
          expect(false).assertEqual(true);
        }
      })

    /**
     * @tc.number   SUB_Security_DataSecurity_AssetStore_Asset_Tag_Test_0800
     * @tc.name     SUB_Security_DataSecurity_AssetStore_Asset_Tag_Test_0800
     * @tc.desc     test error cases
     * @tc.size     Medium
     * @tc.type     Func
     * @tc.level    Level3
     */
    it('SUB_Security_DataSecurity_AssetStore_Asset_Tag_Test_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        let caseName: string = 'SUB_Security_DataSecurity_AssetStore_Asset_Tag_Test_0800';
        try {
          console.info(`${caseName} ---start`);
          let result: number = AssetStore.Asset_CoverTag(10);
          console.info(`${caseName} result is: ` + JSON.stringify(result));
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error(`${caseName} catch err: ` + JSON.stringify(err));
          expect(false).assertEqual(true);
        }
      })

    /**
     * @tc.number   SUB_Security_DataSecurity_AssetStore_Asset_Tag_Test_0900
     * @tc.name     SUB_Security_DataSecurity_AssetStore_Asset_Tag_Test_0900
     * @tc.desc     test error cases
     * @tc.size     Medium
     * @tc.type     Func
     * @tc.level    Level3
     */
    it('SUB_Security_DataSecurity_AssetStore_Asset_Tag_Test_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        let caseName: string = 'SUB_Security_DataSecurity_AssetStore_Asset_Tag_Test_0900';
        try {
          console.info(`${caseName} ---start`);
          let result: number = AssetStore.Asset_CoverTag(11);
          console.info(`${caseName} result is: ` + JSON.stringify(result));
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error(`${caseName} catch err: ` + JSON.stringify(err));
          expect(false).assertEqual(true);
        }
      })

    /**
     * @tc.number   SUB_Security_DataSecurity_AssetStore_Asset_Tag_Test_1000
     * @tc.name     SUB_Security_DataSecurity_AssetStore_Asset_Tag_Test_1000
     * @tc.desc     test error cases
     * @tc.size     Medium
     * @tc.type     Func
     * @tc.level    Level3
     */
    it('SUB_Security_DataSecurity_AssetStore_Asset_Tag_Test_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        let caseName: string = 'SUB_Security_DataSecurity_AssetStore_Asset_Tag_Test_1000';
        try {
          console.info(`${caseName} ---start`);
          let result: number = AssetStore.Asset_CoverTag(12);
          console.info(`${caseName} result is: ` + JSON.stringify(result));
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error(`${caseName} catch err: ` + JSON.stringify(err));
          expect(false).assertEqual(true);
        }
      })

    /**
     * @tc.number   SUB_Security_DataSecurity_AssetStore_Asset_Tag_Test_1100
     * @tc.name     SUB_Security_DataSecurity_AssetStore_Asset_Tag_Test_1100
     * @tc.desc     test error cases
     * @tc.size     Medium
     * @tc.type     Func
     * @tc.level    Level3
     */
    it('SUB_Security_DataSecurity_AssetStore_Asset_Tag_Test_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        let caseName: string = 'SUB_Security_DataSecurity_AssetStore_Asset_Tag_Test_1100';
        try {
          console.info(`${caseName} ---start`);
          let result: number = AssetStore.Asset_CoverTag(13);
          console.info(`${caseName} result is: ` + JSON.stringify(result));
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error(`${caseName} catch err: ` + JSON.stringify(err));
          expect(false).assertEqual(true);
        }
      })

    /**
     * @tc.number   SUB_Security_DataSecurity_AssetStore_Asset_Tag_Test_1200
     * @tc.name     SUB_Security_DataSecurity_AssetStore_Asset_Tag_Test_1200
     * @tc.desc     test error cases
     * @tc.size     Medium
     * @tc.type     Func
     * @tc.level    Level3
     */
    it('SUB_Security_DataSecurity_AssetStore_Asset_Tag_Test_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        let caseName: string = 'SUB_Security_DataSecurity_AssetStore_Asset_Tag_Test_1200';
        try {
          console.info(`${caseName} ---start`);
          let result: number = AssetStore.Asset_CoverTag(14);
          console.info(`${caseName} result is: ` + JSON.stringify(result));
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error(`${caseName} catch err: ` + JSON.stringify(err));
          expect(false).assertEqual(true);
        }
      })

    /**
     * @tc.number   SUB_Security_DataSecurity_AssetStore_Asset_Tag_Test_1300
     * @tc.name     SUB_Security_DataSecurity_AssetStore_Asset_Tag_Test_1300
     * @tc.desc     test error cases
     * @tc.size     Medium
     * @tc.type     Func
     * @tc.level    Level3
     */
    it('SUB_Security_DataSecurity_AssetStore_Asset_Tag_Test_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        let caseName: string = 'SUB_Security_DataSecurity_AssetStore_Asset_Tag_Test_1300';
        try {
          console.info(`${caseName} ---start`);
          let result: number = AssetStore.Asset_CoverTag(15);
          console.info(`${caseName} result is: ` + JSON.stringify(result));
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error(`${caseName} catch err: ` + JSON.stringify(err));
          expect(false).assertEqual(true);
        }
      })

    /**
     * @tc.number   SUB_Security_DataSecurity_AssetStore_Asset_Tag_Test_1400
     * @tc.name     SUB_Security_DataSecurity_AssetStore_Asset_Tag_Test_1400
     * @tc.desc     test error cases
     * @tc.size     Medium
     * @tc.type     Func
     * @tc.level    Level3
     */
    it('SUB_Security_DataSecurity_AssetStore_Asset_Tag_Test_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        let caseName: string = 'SUB_Security_DataSecurity_AssetStore_Asset_Tag_Test_1400';
        try {
          console.info(`${caseName} ---start`);
          let result: number = AssetStore.Asset_CoverTag(16);
          console.info(`${caseName} result is: ` + JSON.stringify(result));
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error(`${caseName} catch err: ` + JSON.stringify(err));
          expect(false).assertEqual(true);
        }
      })

    /**
     * @tc.number   SUB_Security_DataSecurity_AssetStore_Asset_Tag_Test_1500
     * @tc.name     SUB_Security_DataSecurity_AssetStore_Asset_Tag_Test_1500
     * @tc.desc     test error cases
     * @tc.size     Medium
     * @tc.type     Func
     * @tc.level    Level3
     */
    it('SUB_Security_DataSecurity_AssetStore_Asset_Tag_Test_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        let caseName: string = 'SUB_Security_DataSecurity_AssetStore_Asset_Tag_Test_1500';
        try {
          console.info(`${caseName} ---start`);
          let result: number = AssetStore.Asset_CoverTag(17);
          console.info(`${caseName} result is: ` + JSON.stringify(result));
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error(`${caseName} catch err: ` + JSON.stringify(err));
          expect(false).assertEqual(true);
        }
      })

    /**
     * @tc.number   SUB_Security_DataSecurity_AssetStore_Asset_Tag_Test_1600
     * @tc.name     SUB_Security_DataSecurity_AssetStore_Asset_Tag_Test_1600
     * @tc.desc     test error cases
     * @tc.size     Medium
     * @tc.type     Func
     * @tc.level    Level3
     */
    it('SUB_Security_DataSecurity_AssetStore_Asset_Tag_Test_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        let caseName: string = 'SUB_Security_DataSecurity_AssetStore_Asset_Tag_Test_1600';
        try {
          console.info(`${caseName} ---start`);
          let result: number = AssetStore.Asset_CoverTag(18);
          console.info(`${caseName} result is: ` + JSON.stringify(result));
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error(`${caseName} catch err: ` + JSON.stringify(err));
          expect(false).assertEqual(true);
        }
      })

    /**
     * @tc.number   SUB_Security_DataSecurity_AssetStore_Asset_Tag_Test_1700
     * @tc.name     SUB_Security_DataSecurity_AssetStore_Asset_Tag_Test_1700
     * @tc.desc     test error cases
     * @tc.size     Medium
     * @tc.type     Func
     * @tc.level    Level3
     */
    it('SUB_Security_DataSecurity_AssetStore_Asset_Tag_Test_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        let caseName: string = 'SUB_Security_DataSecurity_AssetStore_Asset_Tag_Test_1700';
        try {
          console.info(`${caseName} ---start`);
          let result: number = AssetStore.Asset_CoverTag(19);
          console.info(`${caseName} result is: ` + JSON.stringify(result));
          expect(result).assertEqual(401);
          done();
        } catch (err) {
          console.error(`${caseName} catch err: ` + JSON.stringify(err));
          expect(false).assertEqual(true);
        }
      })

    /**
     * @tc.number   SUB_Security_DataSecurity_AssetStore_Asset_Tag_Test_1800
     * @tc.name     SUB_Security_DataSecurity_AssetStore_Asset_Tag_Test_1800
     * @tc.desc     test error cases
     * @tc.size     Medium
     * @tc.type     Func
     * @tc.level    Level3
     */
    it('SUB_Security_DataSecurity_AssetStore_Asset_Tag_Test_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        let caseName: string = 'SUB_Security_DataSecurity_AssetStore_Asset_Tag_Test_1800';
        try {
          console.info(`${caseName} ---start`);
          let result: number = AssetStore.Asset_CoverTag(20);
          console.info(`${caseName} result is: ` + JSON.stringify(result));
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error(`${caseName} catch err: ` + JSON.stringify(err));
          expect(false).assertEqual(true);
        }
      })

    /**
     * @tc.number   SUB_Security_DataSecurity_AssetStore_Asset_Tag_Test_1900
     * @tc.name     SUB_Security_DataSecurity_AssetStore_Asset_Tag_Test_1900
     * @tc.desc     test error cases
     * @tc.size     Medium
     * @tc.type     Func
     * @tc.level    Level3
     */
    it('SUB_Security_DataSecurity_AssetStore_Asset_Tag_Test_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        let caseName: string = 'SUB_Security_DataSecurity_AssetStore_Asset_Tag_Test_1900';
        try {
          console.info(`${caseName} ---start`);
          let result: number = AssetStore.Asset_CoverTag(21);
          console.info(`${caseName} result is: ` + JSON.stringify(result));
          expect(result).assertEqual(401);
          done();
        } catch (err) {
          console.error(`${caseName} catch err: ` + JSON.stringify(err));
          expect(false).assertEqual(true);
        }
      })

    /**
     * @tc.number   SUB_Security_DataSecurity_AssetStore_Asset_Tag_Test_2000
     * @tc.name     SUB_Security_DataSecurity_AssetStore_Asset_Tag_Test_2000
     * @tc.desc     test error cases
     * @tc.size     Medium
     * @tc.type     Func
     * @tc.level    Level3
     */
    it('SUB_Security_DataSecurity_AssetStore_Asset_Tag_Test_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        let caseName: string = 'SUB_Security_DataSecurity_AssetStore_Asset_Tag_Test_2000';
        try {
          console.info(`${caseName} ---start`);
          let result: number = AssetStore.Asset_CoverTag(22);
          console.info(`${caseName} result is: ` + JSON.stringify(result));
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error(`${caseName} catch err: ` + JSON.stringify(err));
          expect(false).assertEqual(true);
        }
      })

    /**
     * @tc.number   SUB_Security_DataSecurity_AssetStore_Asset_ResultCode_0100
     * @tc.name     SUB_Security_DataSecurity_AssetStore_Asset_ResultCode_0100
     * @tc.desc     test ASSET_PERMISSION_DENIED error code
     * @tc.size     Medium
     * @tc.type     Func
     * @tc.level    Level3
     */
    it('SUB_Security_DataSecurity_AssetStore_Asset_ResultCode_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        let caseName: string = 'SUB_Security_DataSecurity_AssetStore_Asset_ResultCode_0100';
        try {
          console.info(`${caseName} ---start`);
          let result: number = AssetStore.Asset_CoverTag(6);
          console.info(`${caseName} result is: ` + JSON.stringify(result));
          expect(result).assertEqual(201);
          done();
        } catch (err) {
          console.error(`${caseName} catch err: ` + JSON.stringify(err));
          expect(false).assertEqual(true);
        }
      })

    /**
     * @tc.number   SUB_Security_DataSecurity_AssetStore_Asset_ResultCode_0200
     * @tc.name     SUB_Security_DataSecurity_AssetStore_Asset_ResultCode_0200
     * @tc.desc     test ASSET_DUPLICATED error code
     * @tc.size     Medium
     * @tc.type     Func
     * @tc.level    Level3
     */
    it('SUB_Security_DataSecurity_AssetStore_Asset_ResultCode_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        let caseName: string = 'SUB_Security_DataSecurity_AssetStore_Asset_ResultCode_0200';
        try {
          console.info(`${caseName} ---start`);
          let result: number = AssetStore.Asset_Add(ass.aliasNameList[1], ass.secLong);
          result = AssetStore.Asset_Add(ass.aliasNameList[1], ass.secLong);
          console.info(`${caseName} result is: ` + JSON.stringify(result));
          expect(result).assertEqual(24000003);
          done();
        } catch (err) {
          console.error(`${caseName} catch err: ` + JSON.stringify(err));
          expect(false).assertEqual(true);
        }
      })

    /**
     * @tc.number   SUB_Security_DataSecurity_AssetStore_Asset_ResultCode_0300
     * @tc.name     SUB_Security_DataSecurity_AssetStore_Asset_ResultCode_0300
     * @tc.desc     test ASSET_ACCESS_DENIED error code
     * @tc.size     Medium
     * @tc.type     Func
     * @tc.level    Level3
     */
    it('SUB_Security_DataSecurity_AssetStore_Asset_ResultCode_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        let caseName: string = 'SUB_Security_DataSecurity_AssetStore_Asset_ResultCode_0300';
        try {
          console.info(`${caseName} ---start`);
          let result: number = AssetStore.Asset_Deny();
          console.info(`${caseName} result is: ` + JSON.stringify(result));
          expect(result).assertEqual(24000004);
          done();
        } catch (err) {
          console.error(`${caseName} catch err: ` + JSON.stringify(err));
          expect(false).assertEqual(true);
        }
      })

    /**
     * @tc.number   SUB_Security_DataSecurity_AssetStore_Asset_ResultCode_0400
     * @tc.name     SUB_Security_DataSecurity_AssetStore_Asset_ResultCode_0400
     * @tc.desc     test ASSET_IPC_ERROR error code
     * @tc.size     Medium
     * @tc.type     Func
     * @tc.level    Level3
     */
    it('SUB_Security_DataSecurity_AssetStore_Asset_ResultCode_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        let caseName: string = 'SUB_Security_DataSecurity_AssetStore_Asset_ResultCode_0400';
        try {
          console.info(`${caseName} ---start`);
          let result: number = AssetStore.Asset_IPCErr();
          console.info(`${caseName} result is: ` + JSON.stringify(result));
          expect(result).assertEqual(24000010);
          done();
        } catch (err) {
          console.error(`${caseName} catch err: ` + JSON.stringify(err));
          expect(false).assertEqual(true);
        }
      })

    /**
     * @tc.number   SUB_Security_DataSecurity_AssetStore_Asset_Ablity_0100
     * @tc.name     SUB_Security_DataSecurity_AssetStore_Asset_Ablity_0100
     * @tc.desc     test error code enum
     * @tc.size     Medium
     * @tc.type     Func
     * @tc.level    Level3
     */
    it('SUB_Security_DataSecurity_AssetStore_Asset_Ablity_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        let caseName: string = 'SUB_Security_DataSecurity_AssetStore_Asset_Ablity_0100';
        try {
          console.info(`${caseName} ---start`);
          let result: number = AssetStore.Asset_Ablity(0);
          console.info(`${caseName} result is: ` + JSON.stringify(result));
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error(`${caseName} catch err: ` + JSON.stringify(err));
          expect(false).assertEqual(true);
        }
    })

    /**
     * @tc.number   SUB_Security_DataSecurity_AssetStore_Asset_Ablity_0200
     * @tc.name     SUB_Security_DataSecurity_AssetStore_Asset_Ablity_0200
     * @tc.desc     test error code enum
     * @tc.size     Medium
     * @tc.type     Func
     * @tc.level    Level3
     */
    it('SUB_Security_DataSecurity_AssetStore_Asset_Ablity_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        let caseName: string = 'SUB_Security_DataSecurity_AssetStore_Asset_Ablity_0200';
        try {
          console.info(`${caseName} ---start`);
          let result: number = AssetStore.Asset_Ablity(1);
          console.info(`${caseName} result is: ` + JSON.stringify(result));
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error(`${caseName} catch err: ` + JSON.stringify(err));
          expect(false).assertEqual(true);
        }
    })

    /**
     * @tc.number   SUB_Security_DataSecurity_AssetStore_Asset_Ablity_0300
     * @tc.name     SUB_Security_DataSecurity_AssetStore_Asset_Ablity_0300
     * @tc.desc     test ASSET_AUTH_TYPE_NONE enum
     * @tc.size     Medium
     * @tc.type     Func
     * @tc.level    Level3
     */
    it('SUB_Security_DataSecurity_AssetStore_Asset_Ablity_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        let caseName: string = 'SUB_Security_DataSecurity_AssetStore_Asset_Ablity_0300';
        try {
          console.info(`${caseName} ---start`);
          let result: number = AssetStore.Asset_Ablity(2);
          console.info(`${caseName} result is: ` + JSON.stringify(result));
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error(`${caseName} catch err: ` + JSON.stringify(err));
          expect(false).assertEqual(true);
        }
    })

    /**
     * @tc.number   SUB_Security_DataSecurity_AssetStore_Asset_Ablity_0400
     * @tc.name     SUB_Security_DataSecurity_AssetStore_Asset_Ablity_0400
     * @tc.desc     test ASSET_SYNC_TYPE_NEVER enum
     * @tc.size     Medium
     * @tc.type     Func
     * @tc.level    Level3
     */
    it('SUB_Security_DataSecurity_AssetStore_Asset_Ablity_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        let caseName: string = 'SUB_Security_DataSecurity_AssetStore_Asset_Ablity_0400';
        try {
          console.info(`${caseName} ---start`);
          let result: number = AssetStore.Asset_Ablity(3);
          console.info(`${caseName} result is: ` + JSON.stringify(result));
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error(`${caseName} catch err: ` + JSON.stringify(err));
          expect(false).assertEqual(true);
        }
    })

    /**
     * @tc.number   SUB_Security_DataSecurity_AssetStore_Asset_Ablity_0500
     * @tc.name     SUB_Security_DataSecurity_AssetStore_Asset_Ablity_0500
     * @tc.desc     test ASSET_SYNC_TYPE_THIS_DEVICE enum
     * @tc.size     Medium
     * @tc.type     Func
     * @tc.level    Level3
     */
    it('SUB_Security_DataSecurity_AssetStore_Asset_Ablity_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        let caseName: string = 'SUB_Security_DataSecurity_AssetStore_Asset_Ablity_0500';
        try {
          console.info(`${caseName} ---start`);
          let result: number = AssetStore.Asset_Ablity(4);
          console.info(`${caseName} result is: ` + JSON.stringify(result));
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error(`${caseName} catch err: ` + JSON.stringify(err));
          expect(false).assertEqual(true);
        }
    })

    /**
     * @tc.number   SUB_Security_DataSecurity_AssetStore_Asset_Ablity_0600
     * @tc.name     SUB_Security_DataSecurity_AssetStore_Asset_Ablity_0600
     * @tc.desc     test ASSET_SYNC_TYPE_TRUSTED_DEVICE enum
     * @tc.size     Medium
     * @tc.type     Func
     * @tc.level    Level3
     */
    it('SUB_Security_DataSecurity_AssetStore_Asset_Ablity_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        let caseName: string = 'SUB_Security_DataSecurity_AssetStore_Asset_Ablity_0600';
        try {
          console.info(`${caseName} ---start`);
          let result: number = AssetStore.Asset_Ablity(5);
          console.info(`${caseName} result is: ` + JSON.stringify(result));
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error(`${caseName} catch err: ` + JSON.stringify(err));
          expect(false).assertEqual(true);
        }
    })

    /**
     * @tc.number   SUB_Security_DataSecurity_AssetStore_Asset_Ablity_0700
     * @tc.name     SUB_Security_DataSecurity_AssetStore_Asset_Ablity_0700
     * @tc.desc     test ASSET_SYNC_TYPE_TRUSTED_ACCOUNT enum
     * @tc.size     Medium
     * @tc.type     Func
     * @tc.level    Level3
     */
    it('SUB_Security_DataSecurity_AssetStore_Asset_Ablity_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        let caseName: string = 'SUB_Security_DataSecurity_AssetStore_Asset_Ablity_0700';
        try {
          console.info(`${caseName} ---start`);
          let result: number = AssetStore.Asset_Ablity(6);
          console.info(`${caseName} result is: ` + JSON.stringify(result));
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error(`${caseName} catch err: ` + JSON.stringify(err));
          expect(false).assertEqual(true);
        }
    })

    /**
     * @tc.number   SUB_Security_DataSecurity_AssetStore_Asset_Ablity_0800
     * @tc.name     SUB_Security_DataSecurity_AssetStore_Asset_Ablity_0800
     * @tc.desc     test ASSET_WRAP_TYPE_NEVER enum
     * @tc.size     Medium
     * @tc.type     Func
     * @tc.level    Level3
     */
    it('SUB_Security_DataSecurity_AssetStore_Asset_Ablity_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        let caseName: string = 'SUB_Security_DataSecurity_AssetStore_Asset_Ablity_0800';
        try {
          console.info(`${caseName} ---start`);
          let result: number = AssetStore.Asset_Ablity(7);
          console.info(`${caseName} result is: ` + JSON.stringify(result));
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error(`${caseName} catch err: ` + JSON.stringify(err));
          expect(false).assertEqual(true);
        }
    })

    /**
     * @tc.number   SUB_Security_DataSecurity_AssetStore_Asset_Ablity_0900
     * @tc.name     SUB_Security_DataSecurity_AssetStore_Asset_Ablity_0900
     * @tc.desc     test ASSET_WRAP_TYPE_TRUSTED_ACCOUNT enum
     * @tc.size     Medium
     * @tc.type     Func
     * @tc.level    Level3
     */
    it('SUB_Security_DataSecurity_AssetStore_Asset_Ablity_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        let caseName: string = 'SUB_Security_DataSecurity_AssetStore_Asset_Ablity_0900';
        try {
          console.info(`${caseName} ---start`);
          let result: number = AssetStore.Asset_Ablity(8);
          console.info(`${caseName} result is: ` + JSON.stringify(result));
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error(`${caseName} catch err: ` + JSON.stringify(err));
          expect(false).assertEqual(true);
        }
    })

    /**
     * @tc.number   SUB_Security_DataSecurity_AssetStore_Asset_Ablity_1000
     * @tc.name     SUB_Security_DataSecurity_AssetStore_Asset_Ablity_1000
     * @tc.desc     test ASSET_CONFLICT_OVERWRITE enum
     * @tc.size     Medium
     * @tc.type     Func
     * @tc.level    Level3
     */
    it('SUB_Security_DataSecurity_AssetStore_Asset_Ablity_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        let caseName: string = 'SUB_Security_DataSecurity_AssetStore_Asset_Ablity_1000';
        try {
          console.info(`${caseName} ---start`);
          let result: number = AssetStore.Asset_Ablity(9);
          console.info(`${caseName} result is: ` + JSON.stringify(result));
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error(`${caseName} catch err: ` + JSON.stringify(err));
          expect(false).assertEqual(true);
        }
    })

    /**
     * @tc.number   SUB_Security_DataSecurity_AssetStore_Asset_Ablity_1100
     * @tc.name     SUB_Security_DataSecurity_AssetStore_Asset_Ablity_1100
     * @tc.desc     test ASSET_CONFLICT_THROW_ERROR enum
     * @tc.size     Medium
     * @tc.type     Func
     * @tc.level    Level3
     */
    it('SUB_Security_DataSecurity_AssetStore_Asset_Ablity_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        let caseName: string = 'SUB_Security_DataSecurity_AssetStore_Asset_Ablity_1100';
        try {
          console.info(`${caseName} ---start`);
          let result: number = AssetStore.Asset_Ablity(10);
          console.info(`${caseName} result is: ` + JSON.stringify(result));
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error(`${caseName} catch err: ` + JSON.stringify(err));
          expect(false).assertEqual(true);
        }
    })

    /**
     * @tc.number   SUB_Security_DataSecurity_AssetStore_Asset_Ablity_1200
     * @tc.name     SUB_Security_DataSecurity_AssetStore_Asset_Ablity_1200
     * @tc.desc     test ASSET_NEED_SYNC enum
     * @tc.size     Medium
     * @tc.type     Func
     * @tc.level    Level3
     */
    it('SUB_Security_DataSecurity_AssetStore_Asset_Ablity_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        let caseName: string = 'SUB_Security_DataSecurity_AssetStore_Asset_Ablity_1200';
        try {
          console.info(`${caseName} ---start`);
          let result: number = AssetStore.Asset_Ablity(11);
          console.info(`${caseName} result is: ` + JSON.stringify(result));
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error(`${caseName} catch err: ` + JSON.stringify(err));
          expect(false).assertEqual(true);
        }
    })

    /**
     * @tc.number   SUB_Security_DataSecurity_AssetStore_Asset_Ablity_1300
     * @tc.name     SUB_Security_DataSecurity_AssetStore_Asset_Ablity_1300
     * @tc.desc     test ASSET_NEED_LOGOUT enum
     * @tc.size     Medium
     * @tc.type     Func
     * @tc.level    Level3
     */
    it('SUB_Security_DataSecurity_AssetStore_Asset_Ablity_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        let caseName: string = 'SUB_Security_DataSecurity_AssetStore_Asset_Ablity_1300';
        try {
          console.info(`${caseName} ---start`);
          let result: number = AssetStore.Asset_Ablity(12);
          console.info(`${caseName} result is: ` + JSON.stringify(result));
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error(`${caseName} catch err: ` + JSON.stringify(err));
          expect(false).assertEqual(true);
        }
    })

    /**
     * @tc.number   SUB_Security_DataSecurity_AssetStore_Asset_RstCode_0100
     * @tc.name     SUB_Security_DataSecurity_AssetStore_Asset_RstCode_0100
     * @tc.desc     test ASSET_RETURN_ATTRIBUTES enum
     * @tc.size     Medium
     * @tc.type     Func
     * @tc.level    Level3
     */
     it('SUB_Security_DataSecurity_AssetStore_Asset_RstCode_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        let caseName: string = 'SUB_Security_DataSecurity_AssetStore_Asset_RstCode_0100';
        try {
          console.info(`${caseName} ---start`);
          let result: number = AssetStore.Asset_RstCode(ass.aliasLong);
          console.info(`${caseName} result is: ` + JSON.stringify(result));
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error(`${caseName} catch err: ` + JSON.stringify(err));
          expect(false).assertEqual(true);
        }
    })

    /**
     * @tc.number   SUB_Security_DataSecurity_AssetStore_Asset_ResultMember_0100
     * @tc.name     SUB_Security_DataSecurity_AssetStore_Asset_ResultMember_0100
     * @tc.desc     cover Asset_Result 'count' member
     * @tc.size     Medium
     * @tc.type     Func
     * @tc.level    Level3
     */
    it('SUB_Security_DataSecurity_AssetStore_Asset_ResultMember_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        let caseName: string = 'SUB_Security_DataSecurity_AssetStore_Asset_ResultMember_0100';
        try {
          console.info(`${caseName} ---start`);
          let result: number = AssetStore.Asset_ResultMember(0, ass.aliasLong);
          console.info(`${caseName} result is: ` + JSON.stringify(result));
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error(`${caseName} catch err: ` + JSON.stringify(err));
          expect(false).assertEqual(true);
        }
      })

      /**
     * @tc.number   SUB_Security_DataSecurity_AssetStore_Asset_ResultMember_0200
     * @tc.name     SUB_Security_DataSecurity_AssetStore_Asset_ResultMember_0200
     * @tc.desc     cover Asset_Result 'attrs' member
     * @tc.size     Medium
     * @tc.type     Func
     * @tc.level    Level3
     */
    it('SUB_Security_DataSecurity_AssetStore_Asset_ResultMember_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: Function) => {
        let caseName: string = 'SUB_Security_DataSecurity_AssetStore_Asset_ResultMember_0200';
        try {
          console.info(`${caseName} ---start`);
          let result: number = AssetStore.Asset_ResultMember(1, ass.aliasLong);
          console.info(`${caseName} result is: ` + JSON.stringify(result));
          expect(result).assertEqual(0);
          done();
        } catch (err) {
          console.error(`${caseName} catch err: ` + JSON.stringify(err));
          expect(false).assertEqual(true);
        }
    })
  })
}