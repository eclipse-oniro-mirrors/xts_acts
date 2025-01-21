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
const ERROR_INCOMING_MODULE_NAME_NOT_INSTALL = 17700002;
const ERROR_INCOMING_MODULE_NAME_NOT_OVERLAY = 17700033;
const ERROR_CODE = 401;

export default function setOverlayEnabled() {
  describe('setOverlayEnabled', () => {
    /*
     * @tc.number: Sub_Bms_Framework_Status_OverlayEnable_0100
     * @tc.name: SetOverlayEnabledModuleNameIsNull
     * @tc.desc: Failed to set when the incoming moduleName is empty
     */
    it('SetOverlayEnabledModuleNameIsNull', 0, async () => {
      try {
        await overlay.setOverlayEnabled("", true).then(data => {
          console.info("SetOverlayEnabledModuleNameIsNull result1111" + JSON.stringify(data))
          Utils.info("SetOverlayEnabledModuleNameIsNull result" + JSON.stringify(data));
          expect().assertFail();
        })
      } catch (e) {
        Utils.info("SetOverlayEnabledModuleNameIsNull catch" + JSON.stringify(e));
        expect(e.code).assertEqual(ERROR_CODE);
      }

      try {
        overlay.setOverlayEnabled("", true, (err, data) => {
          Utils.info("SetOverlayEnabledModuleNameIsNull result" + JSON.stringify(data));
          Utils.info("SetOverlayEnabledModuleNameIsNull fail" + JSON.stringify(err));
          expect().assertFail();
        });
      } catch (e) {
        Utils.info("SetOverlayEnabledModuleNameIsNull callback catch" + JSON.stringify(e));
        expect(e.code).assertEqual(ERROR_CODE);
      }
    })

    /*
     * @tc.number: Sub_Bms_Framework_Status_OverlayEnable_0500
     * @tc.name: SetOverlayEnabledModuleNameNotInstall
     * @tc.desc: Failed to set when the incoming moduleName is not installed
     */
    it('SetOverlayEnabledModuleNameNotInstall', 0, async () => {
      try {
        await overlay.setOverlayEnabled(MODULE_NAME1, true).then(data => {
          Utils.info("SetOverlayEnabledModuleNameNotInstall result" + JSON.stringify(data));
          expect().assertFail();
        })
      } catch (e) {
        Utils.info("SetOverlayEnabledModuleNameNotInstall catch" + JSON.stringify(e));
        expect(e.code).assertEqual(ERROR_INCOMING_MODULE_NAME_NOT_INSTALL);
      }

      try {
        overlay.setOverlayEnabled(MODULE_NAME1, true, (err, data) => {
          Utils.info("SetOverlayEnabledModuleNameNotInstall result" + JSON.stringify(data));
          Utils.info("SetOverlayEnabledModuleNameNotInstall fail" + JSON.stringify(err));
          expect(err.code).assertEqual(ERROR_INCOMING_MODULE_NAME_NOT_INSTALL);
        });
      }catch (e) {
        Utils.info("SetOverlayEnabledModuleNameNotInstall callback" + JSON.stringify(e));
        expect(e.code).assertEqual(ERROR_INCOMING_MODULE_NAME_NOT_INSTALL);
      }

    })

    /*
     * @tc.number: Sub_Bms_Framework_Status_OverlayEnable_0600
     * @tc.name: SetOverlayEnabledModuleNameIsNotOverlay
     * @tc.desc: Failed to set when the incoming moduleName is not overlay
     */
    it('SetOverlayEnabledModuleNameIsNotOverlay', 0, async () => {
      try {
        await overlay.setOverlayEnabled(MODULE_NAME, true).then(data => {
          Utils.info("SetOverlayEnabledModuleNameIsNotOverlay result" + JSON.stringify(data));
          expect().assertFail();
        })
      }catch (e) {
        Utils.info("SetOverlayEnabledModuleNameIsNotOverlay catch" + JSON.stringify(e));
        expect(e.code).assertEqual(ERROR_INCOMING_MODULE_NAME_NOT_OVERLAY);
      }

      try {
        overlay.setOverlayEnabled(MODULE_NAME, true, (err, data) => {
          Utils.info("SetOverlayEnabledModuleNameIsNotOverlay result" + JSON.stringify(data));
          Utils.info("SetOverlayEnabledModuleNameIsNotOverlay fail" + JSON.stringify(err));
          expect(err.code).assertEqual(ERROR_INCOMING_MODULE_NAME_NOT_OVERLAY);
        });
      }catch (e) {
        Utils.info("SetOverlayEnabledModuleNameIsNotOverlay callback" + JSON.stringify(e));
        expect(e.code).assertEqual(ERROR_INCOMING_MODULE_NAME_NOT_OVERLAY);
      }

    })
  })
}