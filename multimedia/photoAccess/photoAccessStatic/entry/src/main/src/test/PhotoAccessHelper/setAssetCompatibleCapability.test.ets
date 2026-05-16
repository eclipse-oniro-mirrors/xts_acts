/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level, Hypium, beforeAll } from "../../../../hypium/index";
import hilog from '@ohos.hilog'
import Context from "application.Context"
import photoAccessHelper from '@ohos.file.photoAccessHelper';
import { BusinessError } from '@ohos.base'
import { getPermission, driveFn, sleep } from '../Common.test.ets';

let domain: int= 0x0000;
let tag: string = 'testTag';

export default function setAssetCompatibleCapabilityTest() {

  describe("setAssetCompatibleCapabilityTest", (): void => {
    hilog.info(domain, tag, 'setAssetCompatibleCapabilityTest start');
    let appContext: Context = Hypium.get("context") as Context;
    let helper = photoAccessHelper.getPhotoAccessHelper(appContext);
    beforeAll(async () => {
      console.info('beforeAll case');
      await getPermission();
      await driveFn();
      await sleep(1000);
    });
    /**
     * @tc.name   SUB_PHOTOACCESS_SETASSETCOMPATIBLECAPABILITY_STATIC_0100
     * @tc.number SUB_PHOTOACCESS_SETASSETCOMPATIBLECAPABILITY_STATIC_0100
     * @tc.desc   supportedHighResolution is true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_PHOTOACCESS_SETASSETCOMPATIBLECAPABILITY_STATIC_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let testNum = 'SUB_PHOTOACCESS_SETASSETCOMPATIBLECAPABILITY_STATIC_0100';
        try {
          let cfg : photoAccessHelper.AssetCompatibleCapability = {
            supportedHighResolution: true,
          };
          await (helper as photoAccessHelper.PhotoAccessHelper).setAssetCompatibleCapability(cfg);
          done();
        } catch (error) {
          hilog.info(domain, tag,
            testNum + ' failed' + ", error.name:" + error.name + ", error.message:" + error.message);
          expect(false).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_PHOTOACCESS_SETASSETCOMPATIBLECAPABILITY_STATIC_0200
     * @tc.number SUB_PHOTOACCESS_SETASSETCOMPATIBLECAPABILITY_STATIC_0200
     * @tc.desc   supportedHighResolution is false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_PHOTOACCESS_SETASSETCOMPATIBLECAPABILITY_STATIC_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let testNum = 'SUB_PHOTOACCESS_SETASSETCOMPATIBLECAPABILITY_STATIC_0200';
        try {
          let cfg : photoAccessHelper.AssetCompatibleCapability = {
            supportedHighResolution: false,
          };
          await (helper as photoAccessHelper.PhotoAccessHelper).setAssetCompatibleCapability(cfg);
          done();
        } catch (error) {
          hilog.info(domain, tag,
            testNum + ' failed' + ", error.name:" + error.name + ", error.message:" + error.message);
          expect(false).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_PHOTOACCESS_SETASSETCOMPATIBLECAPABILITY_STATIC_0300
     * @tc.number SUB_PHOTOACCESS_SETASSETCOMPATIBLECAPABILITY_STATIC_0300
     * @tc.desc   supportedHighResolution is true twice
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_PHOTOACCESS_SETASSETCOMPATIBLECAPABILITY_STATIC_0300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let testNum = 'SUB_PHOTOACCESS_SETASSETCOMPATIBLECAPABILITY_STATIC_0300';
        try {
          let cfg : photoAccessHelper.AssetCompatibleCapability = {
            supportedHighResolution: true,
          };
          await (helper as photoAccessHelper.PhotoAccessHelper).setAssetCompatibleCapability(cfg);
          await (helper as photoAccessHelper.PhotoAccessHelper).setAssetCompatibleCapability(cfg);
          done();
        } catch (error) {
          hilog.info(domain, tag,
            testNum + ' failed' + ", error.name:" + error.name + ", error.message:" + error.message);
          expect(false).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_PHOTOACCESS_SETASSETCOMPATIBLECAPABILITY_STATIC_0400
     * @tc.number SUB_PHOTOACCESS_SETASSETCOMPATIBLECAPABILITY_STATIC_0400
     * @tc.desc   supportedHighResolution is false twice
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_PHOTOACCESS_SETASSETCOMPATIBLECAPABILITY_STATIC_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let testNum = 'SUB_PHOTOACCESS_SETASSETCOMPATIBLECAPABILITY_STATIC_0400';
        try {
          let cfg : photoAccessHelper.AssetCompatibleCapability = {
            supportedHighResolution: false,
          };
          await (helper as photoAccessHelper.PhotoAccessHelper).setAssetCompatibleCapability(cfg);
          await (helper as photoAccessHelper.PhotoAccessHelper).setAssetCompatibleCapability(cfg);
          done();
        } catch (error) {
          hilog.info(domain, tag,
            testNum + ' failed' + ", error.name:" + error.name + ", error.message:" + error.message);
          expect(false).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_PHOTOACCESS_SETASSETCOMPATIBLECAPABILITY_STATIC_0500
     * @tc.number SUB_PHOTOACCESS_SETASSETCOMPATIBLECAPABILITY_STATIC_0500
     * @tc.desc   supportedHighResolution is false and true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_PHOTOACCESS_SETASSETCOMPATIBLECAPABILITY_STATIC_0500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let testNum = 'SUB_PHOTOACCESS_SETASSETCOMPATIBLECAPABILITY_STATIC_0500';
        try {
          let firstCfg : photoAccessHelper.AssetCompatibleCapability = {
            supportedHighResolution: false,
          };
          let secondCfg : photoAccessHelper.AssetCompatibleCapability = {
            supportedHighResolution: true,
          };
          await (helper as photoAccessHelper.PhotoAccessHelper).setAssetCompatibleCapability(firstCfg);
          await (helper as photoAccessHelper.PhotoAccessHelper).setAssetCompatibleCapability(secondCfg);
          done();
        } catch (error) {
          hilog.info(domain, tag,
            testNum + ' failed' + ", error.name:" + error.name + ", error.message:" + error.message);
          expect(false).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_PHOTOACCESS_SETASSETCOMPATIBLECAPABILITY_STATIC_0600
     * @tc.number SUB_PHOTOACCESS_SETASSETCOMPATIBLECAPABILITY_STATIC_0600
     * @tc.desc   supportedHighResolution is false and supportedMimeType is image/heic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_PHOTOACCESS_SETASSETCOMPATIBLECAPABILITY_STATIC_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let testNum = 'SUB_PHOTOACCESS_SETASSETCOMPATIBLECAPABILITY_STATIC_0600';
        try {
          let cfg : photoAccessHelper.AssetCompatibleCapability = {
            supportedHighResolution: false,
            supportedMimeType : ['image/heic']
          };
          await (helper as photoAccessHelper.PhotoAccessHelper).setAssetCompatibleCapability(cfg);
          done();
        } catch (error) {
          hilog.info(domain, tag,
            testNum + ' failed' + ", error.name:" + error.name + ", error.message:" + error.message);
          expect(false).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_PHOTOACCESS_SETASSETCOMPATIBLECAPABILITY_STATIC_0700
     * @tc.number SUB_PHOTOACCESS_SETASSETCOMPATIBLECAPABILITY_STATIC_0700
     * @tc.desc   supportedHighResolution is true and supportedMimeType is image/jpeg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_PHOTOACCESS_SETASSETCOMPATIBLECAPABILITY_STATIC_0700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let testNum = 'SUB_PHOTOACCESS_SETASSETCOMPATIBLECAPABILITY_STATIC_0700';
        try {
          let cfg : photoAccessHelper.AssetCompatibleCapability = {
            supportedHighResolution: true,
            supportedMimeType : ['image/jpeg']
          };
          await (helper as photoAccessHelper.PhotoAccessHelper).setAssetCompatibleCapability(cfg);
          done();
        } catch (error) {
          hilog.info(domain, tag,
            testNum + ' failed' + ", error.name:" + error.name + ", error.message:" + error.message);
          expect(false).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_PHOTOACCESS_SETASSETCOMPATIBLECAPABILITY_STATIC_0800
     * @tc.number SUB_PHOTOACCESS_SETASSETCOMPATIBLECAPABILITY_STATIC_0800
     * @tc.desc   supportedHighResolution is false and supportedMimeType is image/jpeg + image/heic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_PHOTOACCESS_SETASSETCOMPATIBLECAPABILITY_STATIC_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let testNum = 'SUB_PHOTOACCESS_SETASSETCOMPATIBLECAPABILITY_STATIC_0800';
        try {
          let cfg : photoAccessHelper.AssetCompatibleCapability = {
            supportedHighResolution: false,
            supportedMimeType : ['image/jpeg', 'image/heic']
          };
          await (helper as photoAccessHelper.PhotoAccessHelper).setAssetCompatibleCapability(cfg);
          done();
        } catch (error) {
          hilog.info(domain, tag,
            testNum + ' failed' + ", error.name:" + error.name + ", error.message:" + error.message);
          expect(false).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_PHOTOACCESS_SETASSETCOMPATIBLECAPABILITY_STATIC_0900
     * @tc.number SUB_PHOTOACCESS_SETASSETCOMPATIBLECAPABILITY_STATIC_0900
     * @tc.desc   supportedHighResolution is true and supportedMimeType is 3 image/jpeg + 3 image/heic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_PHOTOACCESS_SETASSETCOMPATIBLECAPABILITY_STATIC_0900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let testNum = 'SUB_PHOTOACCESS_SETASSETCOMPATIBLECAPABILITY_STATIC_0900';
        try {
          let cfg : photoAccessHelper.AssetCompatibleCapability = {
            supportedHighResolution: true,
            supportedMimeType : ['image/jpeg', 'image/heic', 'image/jpeg', 'image/heic', 'image/jpeg', 'image/heic']
          };
          await (helper as photoAccessHelper.PhotoAccessHelper).setAssetCompatibleCapability(cfg);
          done();
        } catch (error) {
          hilog.info(domain, tag,
            testNum + ' failed' + ", error.name:" + error.name + ", error.message:" + error.message);
          expect(false).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_PHOTOACCESS_SETASSETCOMPATIBLECAPABILITY_STATIC_1000
     * @tc.number SUB_PHOTOACCESS_SETASSETCOMPATIBLECAPABILITY_STATIC_1000
     * @tc.desc   supportedHighResolution is false and supportedMimeType is image/jpeg + image/heic + image/png
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_PHOTOACCESS_SETASSETCOMPATIBLECAPABILITY_STATIC_1000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let testNum = 'SUB_PHOTOACCESS_SETASSETCOMPATIBLECAPABILITY_STATIC_1000';
        try {
          let cfg : photoAccessHelper.AssetCompatibleCapability = {
            supportedHighResolution: false,
            supportedMimeType : ['image/jpeg', 'image/heic', 'image/png']
          };
          await (helper as photoAccessHelper.PhotoAccessHelper).setAssetCompatibleCapability(cfg);
          expect(false).assertTrue();
          done();
        } catch (error) {
          hilog.info(domain, tag,
            testNum + ' failed' + ", error.name:" + error.name + ", error.message:" + error.message);
          expect(Number(error.code)).assertEqual(23800151);
          done();
        }
      })

    /**
     * @tc.name   SUB_PHOTOACCESS_SETASSETCOMPATIBLECAPABILITY_STATIC_1100
     * @tc.number SUB_PHOTOACCESS_SETASSETCOMPATIBLECAPABILITY_STATIC_1100
     * @tc.desc   supportedHighResolution is false and supportedMimeType is []
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_PHOTOACCESS_SETASSETCOMPATIBLECAPABILITY_STATIC_1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let testNum = 'SUB_PHOTOACCESS_SETASSETCOMPATIBLECAPABILITY_STATIC_1100';
        try {
          let cfg : photoAccessHelper.AssetCompatibleCapability = {
            supportedHighResolution: false,
            supportedMimeType : []
          };
          await (helper as photoAccessHelper.PhotoAccessHelper).setAssetCompatibleCapability(cfg);
          done();
        } catch (error) {
          hilog.info(domain, tag,
            testNum + ' failed' + ", error.name:" + error.name + ", error.message:" + error.message);
          expect(false).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_PHOTOACCESS_SETASSETCOMPATIBLECAPABILITY_STATIC_1200
     * @tc.number SUB_PHOTOACCESS_SETASSETCOMPATIBLECAPABILITY_STATIC_1200
     * @tc.desc   supportedHighResolution is false and supportedMimeType is ['']
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_PHOTOACCESS_SETASSETCOMPATIBLECAPABILITY_STATIC_1200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let testNum = 'SUB_PHOTOACCESS_SETASSETCOMPATIBLECAPABILITY_STATIC_1200';
        try {
          let cfg : photoAccessHelper.AssetCompatibleCapability = {
            supportedHighResolution: false,
            supportedMimeType : ['']
          };
          await (helper as photoAccessHelper.PhotoAccessHelper).setAssetCompatibleCapability(cfg);
          expect(false).assertTrue();
          done();
        } catch (error) {
          hilog.info(domain, tag,
            testNum + ' failed' + ", error.name:" + error.name + ", error.message:" + error.message);
          expect(Number(error.code)).assertEqual(23800151);
          done();
        }
      })

    /**
     * @tc.name   SUB_PHOTOACCESS_SETASSETCOMPATIBLECAPABILITY_STATIC_1300
     * @tc.number SUB_PHOTOACCESS_SETASSETCOMPATIBLECAPABILITY_STATIC_1300
     * @tc.desc   supportedHighResolution is false and supportedMimeType is ['   ']
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_PHOTOACCESS_SETASSETCOMPATIBLECAPABILITY_STATIC_1300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let testNum = 'SUB_PHOTOACCESS_SETASSETCOMPATIBLECAPABILITY_STATIC_1300';
        try {
          let cfg : photoAccessHelper.AssetCompatibleCapability = {
            supportedHighResolution: false,
            supportedMimeType : ['   ']
          };
          await (helper as photoAccessHelper.PhotoAccessHelper).setAssetCompatibleCapability(cfg);
          expect(false).assertTrue();
          done();
        } catch (error) {
          hilog.info(domain, tag,
            testNum + ' failed' + ", error.name:" + error.name + ", error.message:" + error.message);
          expect(Number(error.code)).assertEqual(23800151);
          done();
        }
      })

    /**
     * @tc.name   SUB_PHOTOACCESS_SETASSETCOMPATIBLECAPABILITY_STATIC_1400
     * @tc.number SUB_PHOTOACCESS_SETASSETCOMPATIBLECAPABILITY_STATIC_1400
     * @tc.desc   supportedHighResolution is true and supportedMimeType is heic then jpeg then heic
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_PHOTOACCESS_SETASSETCOMPATIBLECAPABILITY_STATIC_1400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let testNum = 'SUB_PHOTOACCESS_SETASSETCOMPATIBLECAPABILITY_STATIC_1400';
        try {
          let firstCfg : photoAccessHelper.AssetCompatibleCapability = {
            supportedHighResolution: true,
            supportedMimeType : ['image/heic']
          };
          let secondCfg : photoAccessHelper.AssetCompatibleCapability = {
            supportedHighResolution: true,
            supportedMimeType : ['image/jpeg']
          };
          await (helper as photoAccessHelper.PhotoAccessHelper).setAssetCompatibleCapability(firstCfg);
          await (helper as photoAccessHelper.PhotoAccessHelper).setAssetCompatibleCapability(secondCfg);
          await (helper as photoAccessHelper.PhotoAccessHelper).setAssetCompatibleCapability(firstCfg);
          done();
        } catch (error) {
          hilog.info(domain, tag,
            testNum + ' failed' + ", error.name:" + error.name + ", error.message:" + error.message);
          expect(false).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_PHOTOACCESS_SETASSETCOMPATIBLECAPABILITY_STATIC_1500
     * @tc.number SUB_PHOTOACCESS_SETASSETCOMPATIBLECAPABILITY_STATIC_1500
     * @tc.desc   supportedHighResolution is false and supportedMimeType is heic + jpeg then jpeg
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_PHOTOACCESS_SETASSETCOMPATIBLECAPABILITY_STATIC_1500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let testNum = 'SUB_PHOTOACCESS_SETASSETCOMPATIBLECAPABILITY_STATIC_1500';
        try {
          let firstCfg : photoAccessHelper.AssetCompatibleCapability = {
            supportedHighResolution: false,
            supportedMimeType : ['image/heic', 'image/jpeg']
          };
          let secondCfg : photoAccessHelper.AssetCompatibleCapability = {
            supportedHighResolution: false,
            supportedMimeType : ['image/jpeg']
          };
          await (helper as photoAccessHelper.PhotoAccessHelper).setAssetCompatibleCapability(firstCfg);
          await (helper as photoAccessHelper.PhotoAccessHelper).setAssetCompatibleCapability(secondCfg);
          done();
        } catch (error) {
          hilog.info(domain, tag,
            testNum + ' failed' + ", error.name:" + error.name + ", error.message:" + error.message);
          expect(false).assertTrue();
          done();
        }
      })

    /**
     * @tc.name   SUB_PHOTOACCESS_SETASSETCOMPATIBLECAPABILITY_STATIC_1600
     * @tc.number SUB_PHOTOACCESS_SETASSETCOMPATIBLECAPABILITY_STATIC_1600
     * @tc.desc   supportedHighResolution is false and supportedMimeType is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_PHOTOACCESS_SETASSETCOMPATIBLECAPABILITY_STATIC_1600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let testNum = 'SUB_PHOTOACCESS_SETASSETCOMPATIBLECAPABILITY_STATIC_1600';
        try {
          let cfg : photoAccessHelper.AssetCompatibleCapability = {
            supportedHighResolution: false,
            supportedMimeType : undefined
          };
          await (helper as photoAccessHelper.PhotoAccessHelper).setAssetCompatibleCapability(cfg);
          done();
        } catch (error) {
          hilog.info(domain, tag,
            testNum + ' failed' + ", error.name:" + error.name + ", error.message:" + error.message);
          expect(false).assertTrue();
          done();
        }
      })

  })
  hilog.info(domain, tag, 'setAssetCompatibleCapabilityTest end');
}