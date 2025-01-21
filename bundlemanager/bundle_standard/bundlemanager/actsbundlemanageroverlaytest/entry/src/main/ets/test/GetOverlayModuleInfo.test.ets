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
import Utils from "./Utils";
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from "@ohos/hypium"

const MODULE_NAME = "testModule";
const MODULE_NAME1 = "test1";
const MODULE_NAME2 = "stage1";
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
          Utils.info("GetOverlayModuleInfoModuleNameIsNull result" + JSON.stringify(data));
          expect().assertFail();
        })
      } catch (e) {
        Utils.info("GetOverlayModuleInfoModuleNameIsNull catch" + JSON.stringify(e));
        expect(e.code).assertEqual(ERROR_CODE);
      }

      try {
        overlay.getOverlayModuleInfo("", (err, data) => {
          Utils.info("GetOverlayModuleInfoModuleNameIsNull result" + JSON.stringify(data));
          Utils.info("GetOverlayModuleInfoModuleNameIsNull fail" + JSON.stringify(err));
          expect().assertFail();
        });
      } catch (e) {
        Utils.info("GetOverlayModuleInfoModuleNameIsNull callback catch" + JSON.stringify(e));
        expect(e.code).assertEqual(ERROR_CODE);
      }
    })

    /*
     * @tc.number: Sub_Bms_Framework_Overlay_Query_0300
     * @tc.name: GetOverlayModuleInfoModuleNameNotInstall
     * @tc.desc: The query fails when the incoming moduleName is not installed
     */
    it('GetOverlayModuleInfoModuleNameNotInstall', 0, async  () =>{
      try {
        await overlay.getOverlayModuleInfo(MODULE_NAME1).then(data => {
          Utils.info("GetOverlayModuleInfoModuleNameNotInstall result" + JSON.stringify(data));
          expect().assertFail();
        })
      }catch (e) {
        Utils.info("GetOverlayModuleInfoModuleNameNotInstall  catch" + JSON.stringify(e));
        expect(e.code).assertEqual(ERROR_BUNDLE_IS_NOT_OVERLAY);
      }

      try {
        overlay.getOverlayModuleInfo(MODULE_NAME1, (err, data) => {
          Utils.info("GetOverlayModuleInfoModuleNameNotInstall result" + JSON.stringify(data));
          Utils.info("GetOverlayModuleInfoModuleNameNotInstall fail" + JSON.stringify(err));
          expect(err.code).assertEqual(ERROR_BUNDLE_IS_NOT_OVERLAY);
        });
      }catch (e) {
        Utils.info("GetOverlayModuleInfoModuleNameNotInstall callback catch" + JSON.stringify(e));
        expect(e.code).assertEqual(ERROR_BUNDLE_IS_NOT_OVERLAY);
      }

    })

    /*
     * @tc.number: Sub_Bms_Framework_Overlay_Query_0400
     * @tc.name: GetOverlayModuleInfoModuleNameNotOverlay
     * @tc.desc: Failed to set when the incoming moduleName is not overlay
     */
    it('GetOverlayModuleInfoModuleNameNotOverlay', 0, async  () =>{
      try {
        await overlay.getOverlayModuleInfo(MODULE_NAME).then(data => {
          Utils.info("GetOverlayModuleInfoModuleNameNotOverlay result" + JSON.stringify(data));
          expect().assertFail();
        })
      }catch (e) {
        Utils.info("GetOverlayModuleInfoModuleNameNotOverlay  catch" + JSON.stringify(e));
        expect(e.code).assertEqual(ERROR_BUNDLE_IS_NOT_OVERLAY);
      }

      try {
        overlay.getOverlayModuleInfo(MODULE_NAME, (err, data) => {
          Utils.info("GetOverlayModuleInfoModuleNameNotOverlay result" + JSON.stringify(data));
          Utils.info("GetOverlayModuleInfoModuleNameNotOverlay fail" + JSON.stringify(err));
          expect(err.code).assertEqual(ERROR_BUNDLE_IS_NOT_OVERLAY);
        });
      }catch (e) {
        Utils.info("GetOverlayModuleInfoModuleNameNotOverlay callback catch" + JSON.stringify(e));
        expect(e.code).assertEqual(ERROR_BUNDLE_IS_NOT_OVERLAY);
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
      Utils.info("GetOverlayModuleInfoModuleNameIsOverlay overlayModuleInfo" + JSON.stringify(overlayModuleInfo));
      let overlayModuleInfoTest: overlay.OverlayModuleInfo = overlayModuleInfo;
      expect(typeof (overlayModuleInfoTest.bundleName)).assertEqual('string');
      expect(overlayModuleInfoTest.bundleName).assertEqual("ohos.acts.bundle.overlay.test");
      expect(overlayModuleInfoTest.moduleName).assertEqual("stage1");
      expect(overlayModuleInfoTest.targetModuleName).assertEqual("entry1");
      expect(overlayModuleInfoTest.priority).assertEqual(1);
      expect(overlayModuleInfoTest.state).assertEqual(2);
      Utils.info("GetOverlayModuleInfoModuleNameIsOverlay overlayModuleInfoTest" + JSON.stringify(overlayModuleInfoTest));
    })
  })
}