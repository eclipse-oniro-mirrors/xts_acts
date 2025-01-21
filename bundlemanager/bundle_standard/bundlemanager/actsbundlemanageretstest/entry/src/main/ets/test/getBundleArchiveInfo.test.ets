/**
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

import bundle from '@ohos.bundle';
import { describe, beforeAll, it, expect } from 'hypium/index';

const PATH = "/data/test/"
const ERROR = "error.hap"
const BMSJSTEST1 = "bmsJstest1.hap"
const BMSJSTEST2 = "bmsJstest2.hap"
const BMSJSTEST3 = "bmsJstest3.hap"
const BMSJSTEST4 = "bmsJstest4.hap"
const BMSJSTEST5 = "bmsJstest5.hap"
const BMSJSTEST6 = "bmsJstest6.hap"
const NAME1 = "com.example.myapplication1"
const NAME2 = "com.example.myapplication2"
const NAME3 = "com.example.myapplication4"
const NAME4 = "com.example.myapplication5"
const NAME5 = "com.example.myapplication6"
const DESCRIPTION = "$string:mainability_description"
const APPLICATION_DESCRIPTION = "$string:entry_description"

export default function getBundleArchiveInfo() {

  describe('getBundleArchiveInfo', function () {

    /**
     * @tc.number getBundleArchiveInfo_0100
     * @tc.name BUNDLE::getBundleArchiveInfo
     * @tc.desc Test getBundleArchiveInfo interfaces with one hap.
     */
    it('getBundleArchiveInfo_0100', 0, async function (done) {
      let datainfo = await bundle.getBundleArchiveInfo(PATH + BMSJSTEST1, bundle.BundleFlag.GET_BUNDLE_WITH_ABILITIES)
      expect(datainfo.name).assertEqual(NAME1)
      expect(datainfo.vendor).assertEqual("example")
      expect(datainfo.versionCode).assertEqual(1)
      expect(datainfo.versionName).assertLarger(0)
      expect(datainfo.entryModuleName).assertEqual("entry")
      expect(datainfo.appInfo.description).assertEqual(APPLICATION_DESCRIPTION)
      expect(datainfo.appInfo.descriptionId >= 0).assertTrue()
      expect(datainfo.appInfo.icon).assertEqual("$media:icon")
      expect(parseInt(datainfo.appInfo.iconId)).assertLarger(0)
      expect(datainfo.appInfo.label).assertEqual("$string:app_name")
      expect(parseInt(datainfo.appInfo.labelId)).assertLarger(0)
      expect(datainfo.appInfo.systemApp).assertEqual(false)
      done();
    })

    /**
     * @tc.number getBundleArchiveInfo_0200
     * @tc.name BUNDLE::getBundleArchiveInfo
     * @tc.desc Test getBundleArchiveInfo interfaces with two haps.
     */
    it('getBundleArchiveInfo_0200', 0, async function (done) {
      let datainfo = await bundle.getBundleArchiveInfo(PATH + BMSJSTEST2, bundle.BundleFlag.GET_BUNDLE_WITH_ABILITIES)
      expect(datainfo.name).assertEqual(NAME2)
      expect(datainfo.vendor).assertEqual("example")
      expect(datainfo.versionCode).assertEqual(1)
      expect(datainfo.versionName).assertLarger(0)
      expect(datainfo.entryModuleName).assertEqual("entry")
      expect(datainfo.appInfo.description).assertEqual(APPLICATION_DESCRIPTION)
      expect(datainfo.appInfo.descriptionId >= 0).assertTrue()
      expect(datainfo.appInfo.icon).assertEqual("$media:icon")
      expect(parseInt(datainfo.appInfo.iconId)).assertLarger(0)
      expect(datainfo.appInfo.label).assertEqual("$string:app_name")
      expect(parseInt(datainfo.appInfo.labelId)).assertLarger(0)
      expect(datainfo.appInfo.systemApp).assertEqual(false)
      done();
    })

    /**
     * @tc.number getBundleArchiveInfo_0300
     * @tc.name BUNDLE::getBundleArchiveInfo
     * @tc.desc Test getBundleArchiveInfo interfaces with three haps.
     */
    it('getBundleArchiveInfo_0300', 0, async function (done) {
      let datainfo = await bundle.getBundleArchiveInfo(PATH + BMSJSTEST4, bundle.BundleFlag.GET_BUNDLE_WITH_ABILITIES)
      expect(datainfo.name).assertEqual(NAME3)
      expect(datainfo.vendor).assertEqual("example")
      expect(datainfo.versionCode).assertEqual(1)
      expect(datainfo.versionName).assertLarger(0)
      expect(datainfo.entryModuleName).assertEqual("entry")
      expect(datainfo.appInfo.description).assertEqual(APPLICATION_DESCRIPTION)
      expect(datainfo.appInfo.descriptionId >= 0).assertTrue()
      expect(datainfo.appInfo.icon).assertEqual("$media:icon")
      expect(parseInt(datainfo.appInfo.iconId)).assertLarger(0)
      expect(datainfo.appInfo.label).assertEqual("$string:app_name")
      expect(parseInt(datainfo.appInfo.labelId)).assertLarger(0)
      expect(datainfo.appInfo.systemApp).assertEqual(false)
      done();
    })

    /**
     * @tc.number getBundleArchiveInfo_0400
     * @tc.name BUNDLE::getBundleArchiveInfo
     * @tc.desc Test getBundleArchiveInfo interfaces with error hap.
     */
    it('getBundleArchiveInfo_0400', 0, async function (done) {
      await bundle.getBundleArchiveInfo(PATH + ERROR, bundle.BundleFlag.GET_BUNDLE_WITH_ABILITIES).then(datainfo => {
        console.info("getBundleArchiveInfo success" + JSON.stringify(datainfo))
        expect(datainfo).assertFail()
        done()
      }).catch(err => {
        console.info("getBundleArchiveInfo fail" + JSON.stringify(err))
        expect(err.code).assertEqual(1)
        done()
      })
    })

    /**
     * @tc.number getBundleArchiveInfo_0500
     * @tc.name BUNDLE::getBundleArchiveInfo
     * @tc.desc Test getBundleArchiveInfo interfaces with none hap.
     */
    it('getBundleArchiveInfo_0500', 0, async function (done) {
      let datainfo = await bundle.getBundleArchiveInfo(' ', bundle.BundleFlag.GET_BUNDLE_WITH_ABILITIES).then(datainfo => {
        console.info("getBundleArchiveInfo success" + JSON.stringify(datainfo))
        expect(datainfo).assertFail()
        done()
      }).catch(err => {
        console.info("getBundleArchiveInfo fail" + JSON.stringify(err))
        expect(err.code).assertEqual(1)
        done()
      })
    })

    /**
     * @tc.number getBundleArchiveInfo_0600
     * @tc.name BUNDLE::getBundleArchiveInfo
     * @tc.desc Test getBundleArchiveInfo interfaces with none hap.
     */
    it('getBundleArchiveInfo_0600', 0, async function (done) {
      await bundle.getBundleArchiveInfo(PATH + BMSJSTEST1, bundle.BundleFlag.GET_BUNDLE_WITH_ABILITIES, OnReceiveEvent)
      function OnReceiveEvent(err, datainfo) {
        expect(datainfo.name).assertEqual(NAME1)
        expect(datainfo.vendor).assertEqual("example")
        expect(datainfo.versionCode).assertEqual(1)
        expect(datainfo.versionName).assertEqual("1.0")
        expect(datainfo.entryModuleName).assertEqual("entry")
        expect(datainfo.appInfo.name).assertEqual(NAME1)
        expect(datainfo.appInfo.description).assertEqual(APPLICATION_DESCRIPTION)
        expect(datainfo.appInfo.descriptionId >= 0).assertTrue()
        expect(datainfo.appInfo.icon).assertEqual("$media:icon")
        expect(parseInt(datainfo.appInfo.iconId)).assertLarger(0)
        expect(datainfo.appInfo.label).assertEqual("$string:app_name")
        expect(parseInt(datainfo.appInfo.labelId)).assertLarger(0)
        expect(datainfo.appInfo.systemApp).assertEqual(false)
        expect(datainfo.appInfo.supportedModes).assertEqual(0)
        for (let j = 0; j < datainfo.appInfo.moduleInfos.length; j++) {
          expect(datainfo.appInfo.moduleInfos[j].moduleName).assertEqual("entry")
        }
        for (let j = 0; j < datainfo.abilityInfos.length; j++) {
          expect(datainfo.abilityInfos[j].name).assertEqual("com.example.myapplication1.MainAbility")
          expect(datainfo.abilityInfos[j].label).assertEqual("$string:app_name")
          expect(datainfo.abilityInfos[j].description).assertEqual(DESCRIPTION)
          expect(datainfo.abilityInfos[j].icon).assertEqual("$media:icon")
          expect(datainfo.abilityInfos[j].isVisible).assertEqual(false)
          expect(datainfo.abilityInfos[j].bundleName).assertEqual(NAME1)
          expect(datainfo.abilityInfos[j].moduleName).assertEqual("entry")
        }
        done();
      }
    })

    /**
     * @tc.number getBundleArchiveInfo_0700
     * @tc.name BUNDLE::getBundleArchiveInfo
     * @tc.desc Test getBundleArchiveInfo interfaces with two hap.
     */
    it('getBundleArchiveInfo_0700', 0, async function (done) {
      await bundle.getBundleArchiveInfo(PATH + BMSJSTEST2, bundle.BundleFlag.GET_BUNDLE_WITH_ABILITIES, OnReceiveEvent)
      function OnReceiveEvent(err, datainfo) {
        expect(datainfo.name).assertEqual(NAME2)
        expect(datainfo.vendor).assertEqual("example")
        expect(datainfo.versionCode).assertEqual(1)
        expect(datainfo.versionName).assertLarger(0)
        expect(datainfo.entryModuleName).assertEqual("entry")
        expect(datainfo.appInfo.description).assertEqual(APPLICATION_DESCRIPTION)
        expect(datainfo.appInfo.descriptionId >= 0).assertTrue()
        expect(datainfo.appInfo.icon).assertEqual("$media:icon")
        expect(parseInt(datainfo.appInfo.iconId)).assertLarger(0)
        expect(datainfo.appInfo.label).assertEqual("$string:app_name")
        expect(parseInt(datainfo.appInfo.labelId)).assertLarger(0)
        expect(datainfo.appInfo.systemApp).assertEqual(false)
        done();
      }
    })

    /**
     * @tc.number getBundleArchiveInfo_0800
     * @tc.name BUNDLE::getBundleArchiveInfo
     * @tc.desc Test getBundleArchiveInfo interfaces with one hap.
     */
    it('getBundleArchiveInfo_0800', 0, async function (done) {
      await bundle.getBundleArchiveInfo(PATH + BMSJSTEST4, bundle.BundleFlag.GET_BUNDLE_WITH_ABILITIES, OnReceiveEvent)
      function OnReceiveEvent(err, datainfo) {
        expect(datainfo.name).assertEqual(NAME3)
        expect(datainfo.vendor).assertEqual("example")
        expect(datainfo.versionCode).assertEqual(1)
        expect(datainfo.versionName).assertLarger(0)
        expect(datainfo.entryModuleName).assertEqual("entry")
        expect(datainfo.appInfo.description).assertEqual(APPLICATION_DESCRIPTION)
        expect(datainfo.appInfo.descriptionId >= 0).assertTrue()
        expect(datainfo.appInfo.icon).assertEqual("$media:icon")
        expect(parseInt(datainfo.appInfo.iconId)).assertLarger(0)
        expect(datainfo.appInfo.label).assertEqual("$string:app_name")
        expect(parseInt(datainfo.appInfo.labelId)).assertLarger(0)
        expect(datainfo.appInfo.systemApp).assertEqual(false)
        done();
      }
    })

    /**
     * @tc.number getBundleArchiveInfo_0900
     * @tc.name BUNDLE::getBundleArchiveInfo
     * @tc.desc Test getBundleArchiveInfo interfaces with error hap.
     */
    it('getBundleArchiveInfo_0900', 0, async function (done) {
      await bundle.getBundleArchiveInfo(PATH + ERROR, bundle.BundleFlag.GET_BUNDLE_WITH_ABILITIES, OnReceiveEvent)
      function OnReceiveEvent(err, datainfo) {
        if (err) {
          console.info("getBundleArchiveInfo error" + JSON.stringify(err));
          expect(err.code).assertEqual(1);
          done();
          return;
        }
        console.info("getBundleArchiveInfo sucess" + JSON.stringify(datainfo));
        expect(datainfo).assertFail();
        done();
      }
    })

    /**
     * @tc.number getBundleArchiveInfo_1000
     * @tc.name BUNDLE::getBundleArchiveInfo
     * @tc.desc Test getBundleArchiveInfo interfaces with none hap.
     */
    it('getBundleArchiveInfo_1000', 0, async function (done) {
      await bundle.getBundleArchiveInfo(' ', bundle.BundleFlag.GET_BUNDLE_WITH_ABILITIES, OnReceiveEvent)
      function OnReceiveEvent(err, datainfo) {
        if (err) {
          console.info("getBundleArchiveInfo error" + JSON.stringify(err));
          expect(err.code).assertEqual(1);
          done();
          return;
        }
        console.info("getBundleArchiveInfo sucess" + JSON.stringify(datainfo));
        expect(datainfo).assertFail();
        done();
      }
    })

    /**
     * @tc.number getBundleArchiveInfo_1100
     * @tc.name BUNDLE::getBundleArchiveInfo
     * @tc.desc Test getBundleArchiveInfo interfaces with none hap.
     */
    it('getBundleArchiveInfo_1100', 0, async function (done) {
      await bundle.getBundleArchiveInfo(PATH + BMSJSTEST1, bundle.BundleFlag.GET_BUNDLE_DEFAULT, OnReceiveEvent)
      function OnReceiveEvent(err, datainfo) {
        expect(datainfo.name).assertEqual(NAME1)
        expect(datainfo.vendor).assertEqual("example")
        expect(datainfo.versionCode).assertEqual(1)
        expect(datainfo.versionName).assertEqual("1.0")
        expect(datainfo.entryModuleName).assertEqual("entry")
        expect(datainfo.appInfo.name).assertEqual(NAME1)
        expect(datainfo.appInfo.description).assertEqual(APPLICATION_DESCRIPTION)
        expect(datainfo.appInfo.descriptionId >= 0).assertTrue()
        expect(datainfo.appInfo.icon).assertEqual("$media:icon")
        expect(parseInt(datainfo.appInfo.iconId)).assertLarger(0)
        expect(datainfo.appInfo.label).assertEqual("$string:app_name")
        expect(parseInt(datainfo.appInfo.labelId)).assertLarger(0)
        expect(datainfo.appInfo.systemApp).assertEqual(false)
        expect(datainfo.appInfo.supportedModes).assertEqual(0)
        for (let j = 0; j < datainfo.appInfo.moduleInfos.length; j++) {
          expect(datainfo.appInfo.moduleInfos[j].moduleName).assertEqual("entry")
        }
        for (let j = 0; j < datainfo.abilityInfos.length; j++) {
          expect(datainfo.abilityInfos[j].name).assertEqual(".MainAbility")
          expect(datainfo.abilityInfos[j].label).assertEqual("$string:app_name")
          expect(datainfo.abilityInfos[j].description).assertEqual(DESCRIPTION)
          expect(datainfo.abilityInfos[j].icon).assertEqual("$media:icon")
          expect(datainfo.abilityInfos[j].isVisible).assertEqual(false)
          expect(datainfo.abilityInfos[j].bundleName).assertEqual(NAME1)
          expect(datainfo.abilityInfos[j].moduleName).assertEqual("entry")
        }
        done();
      }
    })

    /**
     * @tc.number getBundleArchiveInfo_1200
     * @tc.name BUNDLE::getBundleArchiveInfo
     * @tc.desc Test getBundleArchiveInfo interfaces with none hap.
     */
    it('getBundleArchiveInfo_1200', 0, async function (done) {
      await bundle.getBundleArchiveInfo(PATH + BMSJSTEST1, bundle.BundleFlag.GET_BUNDLE_DEFAULT, OnReceiveEvent)
      function OnReceiveEvent(err, datainfo) {
        expect(datainfo.name).assertEqual(NAME1)
        expect(datainfo.vendor).assertEqual("example")
        expect(datainfo.versionCode).assertEqual(1)
        expect(datainfo.versionName).assertEqual("1.0")
        expect(datainfo.entryModuleName).assertEqual("entry")
        expect(datainfo.appInfo.name).assertEqual(NAME1)
        expect(datainfo.appInfo.description).assertEqual(APPLICATION_DESCRIPTION)
        expect(datainfo.appInfo.descriptionId >= 0).assertTrue()
        expect(datainfo.appInfo.icon).assertEqual("$media:icon")
        expect(parseInt(datainfo.appInfo.iconId)).assertLarger(0)
        expect(datainfo.appInfo.label).assertEqual("$string:app_name")
        expect(parseInt(datainfo.appInfo.labelId)).assertLarger(0)
        expect(datainfo.appInfo.systemApp).assertEqual(false)
        expect(datainfo.appInfo.supportedModes).assertEqual(0)
        for (let j = 0; j < datainfo.appInfo.moduleInfos.length; j++) {
          expect(datainfo.appInfo.moduleInfos[j].moduleName).assertEqual("entry")
        }
        for (let j = 0; j < datainfo.abilityInfos.length; j++) {
          expect(datainfo.abilityInfos[j].name).assertEqual(".MainAbility")
          expect(datainfo.abilityInfos[j].label).assertEqual("$string:app_name")
          expect(datainfo.abilityInfos[j].description).assertEqual(DESCRIPTION)
          expect(datainfo.abilityInfos[j].icon).assertEqual("$media:icon")
          expect(datainfo.abilityInfos[j].isVisible).assertEqual(false)
          expect(datainfo.abilityInfos[j].bundleName).assertEqual(NAME1)
          expect(datainfo.abilityInfos[j].moduleName).assertEqual("entry")
        }
        done();
      }
    })


  })
}