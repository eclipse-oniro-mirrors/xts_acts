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
import { describe, beforeAll, it, expect } from '@ohos/hypium';

const PATH = "/data/test/"
const ERROR = "error.hap"
const BMSJSTEST1 = "/data/app/el1/bundle/public/com.example.myapplication1/entry.hap"
const BMSJSTEST2 = "/data/app/el1/bundle/public/com.example.myapplication2/entry.hap"
const BMSJSTEST4 = "/data/app/el1/bundle/public/com.example.myapplication4/entry.hap"
const NAME1 = "com.example.myapplication1"
const NAME2 = "com.example.myapplication2"
const NAME3 = "com.example.myapplication4"
const DESCRIPTION = "$string:mainability_description"
const APPLICATION_DESCRIPTION = "$string:entry_description"

export default function getBundleArchiveInfo() {

  describe('getBundleArchiveInfo', function () {

    /**
     * @tc.number Sub_Bms_Framework_Query_AppInfo_1280
     * @tc.name BUNDLE::getBundleArchiveInfo
     * @tc.desc Test getBundleArchiveInfo interfaces with one hap.
     */
    it('Sub_Bms_Framework_Query_AppInfo_1280', 0, async function (done) {
      let datainfo = await bundle.getBundleArchiveInfo(BMSJSTEST1, bundle.BundleFlag.GET_BUNDLE_WITH_ABILITIES)
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
     * @tc.number Sub_Bms_Framework_Query_AppInfo_1300
     * @tc.name BUNDLE::getBundleArchiveInfo
     * @tc.desc Test getBundleArchiveInfo interfaces with two haps.
     */
    it('Sub_Bms_Framework_Query_AppInfo_1300', 0, async function (done) {
      let datainfo = await bundle.getBundleArchiveInfo(BMSJSTEST2, bundle.BundleFlag.GET_BUNDLE_WITH_ABILITIES)
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
     * @tc.number Sub_Bms_Framework_Query_AppInfo_1320
     * @tc.name BUNDLE::getBundleArchiveInfo
     * @tc.desc Test getBundleArchiveInfo interfaces with three haps.
     */
    it('Sub_Bms_Framework_Query_AppInfo_1320', 0, async function (done) {
      let datainfo = await bundle.getBundleArchiveInfo(BMSJSTEST4, bundle.BundleFlag.GET_BUNDLE_WITH_ABILITIES)
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
     * @tc.number Sub_Bms_Framework_Query_AppInfo_1340
     * @tc.name BUNDLE::getBundleArchiveInfo
     * @tc.desc Test getBundleArchiveInfo interfaces with error hap.
     */
    it('Sub_Bms_Framework_Query_AppInfo_1340', 0, async function (done) {
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
     * @tc.number Sub_Bms_Framework_Query_AppInfo_1360
     * @tc.name BUNDLE::getBundleArchiveInfo
     * @tc.desc Test getBundleArchiveInfo interfaces with none hap.
     */
    it('Sub_Bms_Framework_Query_AppInfo_1360', 0, async function (done) {
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
     * @tc.number Sub_Bms_Framework_Query_AppInfo_1380
     * @tc.name BUNDLE::getBundleArchiveInfo
     * @tc.desc Test getBundleArchiveInfo interfaces with none hap.
     */
    it('Sub_Bms_Framework_Query_AppInfo_1380', 0, async function (done) {
      await bundle.getBundleArchiveInfo(BMSJSTEST1, bundle.BundleFlag.GET_BUNDLE_WITH_ABILITIES, OnReceiveEvent)
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
     * @tc.number Sub_Bms_Framework_Query_AppInfo_1400
     * @tc.name BUNDLE::getBundleArchiveInfo
     * @tc.desc Test getBundleArchiveInfo interfaces with two hap.
     */
    it('Sub_Bms_Framework_Query_AppInfo_1400', 0, async function (done) {
      await bundle.getBundleArchiveInfo(BMSJSTEST2, bundle.BundleFlag.GET_BUNDLE_WITH_ABILITIES, OnReceiveEvent)
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
     * @tc.number Sub_Bms_Framework_Query_AppInfo_1420
     * @tc.name BUNDLE::getBundleArchiveInfo
     * @tc.desc Test getBundleArchiveInfo interfaces with one hap.
     */
    it('Sub_Bms_Framework_Query_AppInfo_1420', 0, async function (done) {
      await bundle.getBundleArchiveInfo(BMSJSTEST4, bundle.BundleFlag.GET_BUNDLE_WITH_ABILITIES, OnReceiveEvent)
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
     * @tc.number Sub_Bms_Framework_Query_AppInfo_1440
     * @tc.name BUNDLE::getBundleArchiveInfo
     * @tc.desc Test getBundleArchiveInfo interfaces with error hap.
     */
    it('Sub_Bms_Framework_Query_AppInfo_1440', 0, async function (done) {
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
     * @tc.number Sub_Bms_Framework_Query_AppInfo_1460
     * @tc.name BUNDLE::getBundleArchiveInfo
     * @tc.desc Test getBundleArchiveInfo interfaces with none hap.
     */
    it('Sub_Bms_Framework_Query_AppInfo_1460', 0, async function (done) {
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
     * @tc.number Sub_Bms_Framework_Query_AppInfo_1480
     * @tc.name BUNDLE::getBundleArchiveInfo
     * @tc.desc Test getBundleArchiveInfo interfaces with none hap.
     */
    it('Sub_Bms_Framework_Query_AppInfo_1480', 0, async function (done) {
      await bundle.getBundleArchiveInfo(BMSJSTEST1, bundle.BundleFlag.GET_BUNDLE_DEFAULT, OnReceiveEvent)
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
     * @tc.number Sub_Bms_Framework_Query_AppInfo_1500
     * @tc.name BUNDLE::getBundleArchiveInfo
     * @tc.desc Test getBundleArchiveInfo interfaces with none hap.
     */
    it('Sub_Bms_Framework_Query_AppInfo_1500', 0, async function (done) {
      await bundle.getBundleArchiveInfo(BMSJSTEST1, bundle.BundleFlag.GET_BUNDLE_DEFAULT, OnReceiveEvent)
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