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
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or impligetProfileByAbilityEmptyAbilityCalled.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import overlay from '@ohos.bundle.overlay';
import { BusinessError } from '@kit.BasicServicesKit';
import Utils from "./Utils";
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect ,TestType ,Size ,Level } from "@ohos/hypium"

const MODULE_NAME = "entry_test";
const MODULE_NAME1 = "test1";
const MODULE_NAME2 = "stage1";
const MODULE_NAME3 = "entry";
const ERROR_INCOMING_MODULE_NAME_NOT_INSTALL = 17700002;
const ERROR_BUNDLE_IS_NOT_OVERLAY = 17700032;
const ERROR_INCOMING_MODULE_NAME_NOT_OVERLAY = 17700033;
const ERROR_CODE = 401;

export default function getOverlayModuleInfo() {
  describe('getOverlayModuleInfo',  () =>{
    /*
     * @tc.number: Sub_Bms_Framework_Overlay_Query_0100
     * @tc.name: GetOverlayModuleInfoModuleNameIsNull
     * @tc.desc: The query fails when the incoming moduleName is empty
     */
    it('GetOverlayModuleInfoModuleNameIsNull', 0, async  () =>{
      try {
        await overlay.getOverlayModuleInfo("").then(data => {
          console.info("GetOverlayModuleInfoModuleNameIsNull result" + JSON.stringify(data));
          expect().assertFail();
        })
      } catch (e) {
        console.info("GetOverlayModuleInfoModuleNameIsNull catch" + JSON.stringify(e));
        expect(e.code).assertEqual(ERROR_CODE);
      }

      try {
        overlay.getOverlayModuleInfo("", (err, data) => {
          console.info("GetOverlayModuleInfoModuleNameIsNull result" + JSON.stringify(data));
          console.info("GetOverlayModuleInfoModuleNameIsNull fail" + JSON.stringify(err));
          expect().assertFail();
        });
      } catch (e) {
        console.info("GetOverlayModuleInfoModuleNameIsNull callback catch" + JSON.stringify(e));
        expect(e.code).assertEqual(ERROR_CODE);
      }
    })

    /*
     * @tc.number: Sub_Bms_Framework_Overlay_Query_0410
     * @tc.name: GetOverlayModuleInfoModuleNameNotExisted
     * @tc.desc: The query fails when the incoming moduleName is not existed
     */
    it('GetOverlayModuleInfoModuleNameNotExisted', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async  () =>{
      try {
        await overlay.getOverlayModuleInfo(MODULE_NAME1).then(data => {
          console.info("GetOverlayModuleInfoModuleNameNotExisted result" + JSON.stringify(data));
          expect().assertFail();
        }).catch((err: BusinessError) => {
        console.info("GetOverlayModuleInfoModuleNameNotExisted fail" + JSON.stringify(err));
        expect(err.code).assertEqual(ERROR_INCOMING_MODULE_NAME_NOT_INSTALL);
      });
      }catch (e) {
        console.info("GetOverlayModuleInfoModuleNameNotExisted  catch" + JSON.stringify(e));
        expect().assertFail();
      }
      try {
        overlay.getOverlayModuleInfo(MODULE_NAME1, (err, data) => {
          console.info("GetOverlayModuleInfoModuleNameNotExisted result" + JSON.stringify(data));
          console.info("GetOverlayModuleInfoModuleNameNotExisted fail" + JSON.stringify(err));
          expect(err.code).assertEqual(ERROR_INCOMING_MODULE_NAME_NOT_INSTALL);
        });
      }catch (e) {
        console.info("GetOverlayModuleInfoModuleNameNotExisted callback catch" + JSON.stringify(e));
        expect().assertFail();      
        }
    })

    /*
     * @tc.number: Sub_Bms_Framework_Overlay_Query_0420
     * @tc.name: GetOverlayModuleInfoModuleNotOverlay
     * @tc.desc: The query fails when the incoming moduleName is not overlay
     */
    it('GetOverlayModuleInfoModuleNotOverlay', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async  () =>{
      try {
        await overlay.getOverlayModuleInfo(MODULE_NAME3).then(data => {
          console.info("GetOverlayModuleInfoModuleNotOverlay result" + JSON.stringify(data));
          expect().assertFail();
        }).catch((err: BusinessError) => {
          console.info("GetOverlayModuleInfoModuleNotOverlay fail" + JSON.stringify(err));
          expect(err.code).assertEqual(ERROR_INCOMING_MODULE_NAME_NOT_OVERLAY);
      });
      }catch (e) {
        console.info("GetOverlayModuleInfoModuleNotOverlay  catch" + JSON.stringify(e));
        expect().assertFail();
      }
      try {
        overlay.getOverlayModuleInfo(MODULE_NAME3, (err, data) => {
          console.info("GetOverlayModuleInfoModuleNotOverlay result" + JSON.stringify(data));
          console.info("GetOverlayModuleInfoModuleNotOverlay fail" + JSON.stringify(err));
          expect(err.code).assertEqual(ERROR_INCOMING_MODULE_NAME_NOT_OVERLAY);
        });
      }catch (e) {
        console.info("GetOverlayModuleInfoModuleNotOverlay callback catch" + JSON.stringify(e));
        expect().assertFail();
      }
    })

    /*
     * @tc.number: SUB_BMS_APPINFO_OVERLAY_000X
     * @tc.name: GetOverlayModuleInfoModuleNameIsOverlay
     * @tc.desc: Query succeeded when the moduleName passed in is overlay
     */
    it('GetOverlayModuleInfoModuleNameIsOverlay', 0, async  () =>{
      let overlayModuleInfo:overlay.OverlayModuleInfo = {
        bundleName: "ohos.acts.bundle.overlay.test",
        moduleName: "stage1",
        targetModuleName: "entry1",
        priority: 1,
        state: 2
      }
      console.info("GetOverlayModuleInfoModuleNameIsOverlay overlayModuleInfo" + JSON.stringify(overlayModuleInfo));
      let overlayModuleInfoTest: overlay.OverlayModuleInfo = overlayModuleInfo;
      expect(typeof (overlayModuleInfoTest.bundleName)).assertEqual('string');
      expect(overlayModuleInfoTest.bundleName).assertEqual("ohos.acts.bundle.overlay.test");
      expect(overlayModuleInfoTest.moduleName).assertEqual("stage1");
      expect(overlayModuleInfoTest.targetModuleName).assertEqual("entry1");
      expect(overlayModuleInfoTest.priority).assertEqual(1);
      expect(overlayModuleInfoTest.state).assertEqual(2);
      console.info("GetOverlayModuleInfoModuleNameIsOverlay overlayModuleInfoTest" + JSON.stringify(overlayModuleInfoTest));
    })
  })
}