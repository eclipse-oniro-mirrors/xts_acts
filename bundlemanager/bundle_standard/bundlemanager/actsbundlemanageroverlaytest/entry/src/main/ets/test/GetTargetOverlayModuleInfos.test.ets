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
const ERROR_INCOMING_MODULE_NAME_IS_OVERLAY = 17700034;
const ERROR_CODE = 401;

export default function getTargetOverlayModuleInfos() {
  describe('getTargetOverlayModuleInfos', () => {
    /*
     * @tc.number: Sub_Bms_Framework_Overlay_Query_0600
     * @tc.name: GetTargetOverlayModuleInfosModuleNameIsNull
     * @tc.desc: The query fails when the incoming moduleName is empty
     */
    it('GetTargetOverlayModuleInfosModuleNameIsNull', 0, async () => {
      try {
        await overlay.getTargetOverlayModuleInfos("").then(data => {
          Utils.info("GetTargetOverlayModuleInfosModuleNameIsNull result" + JSON.stringify(data));
          expect().assertFail();
        })
      } catch (e) {
        Utils.info("GetTargetOverlayModuleInfosModuleNameIsNull catch" + JSON.stringify(e));
        expect(e.code).assertEqual(ERROR_CODE);
      }

      try {
        overlay.getTargetOverlayModuleInfos("", (err, data) => {
          Utils.info("GetTargetOverlayModuleInfosModuleNameIsNull result" + JSON.stringify(data));
          Utils.info("GetTargetOverlayModuleInfosModuleNameIsNull fail" + JSON.stringify(err));
          expect().assertFail();
        });
      } catch (e) {
        Utils.info("SetOverlayEnabledModuleNameIsNull callback catch" + JSON.stringify(e));
        expect(e.code).assertEqual(ERROR_CODE);
      }
    })

    /*
     * @tc.number: Sub_Bms_Framework_Overlay_Query_0800
     * @tc.name: GetTargetOverlayModuleInfosModuleNameNotInstall
     * @tc.desc: The query fails when the incoming moduleName is not installed
     */
    it('GetTargetOverlayModuleInfosModuleNameNotInstall', 0, async () => {
      try {
        await overlay.getTargetOverlayModuleInfos(MODULE_NAME1).then(data => {
          Utils.info("GetTargetOverlayModuleInfosModuleNameNotInstall result" + JSON.stringify(data));
          expect().assertFail();
        })
      }catch (e) {
        Utils.info("GetTargetOverlayModuleInfosModuleNameNotInstall  catch" + JSON.stringify(e));
        expect(e.code).assertEqual(ERROR_INCOMING_MODULE_NAME_NOT_INSTALL);
      }

      try {
        overlay.getTargetOverlayModuleInfos(MODULE_NAME1, (err, data) => {
          Utils.info("GetTargetOverlayModuleInfosModuleNameNotInstall result" + JSON.stringify(data));
          Utils.info("GetTargetOverlayModuleInfosModuleNameNotInstall fail" + JSON.stringify(err));
          expect(err.code).assertEqual(ERROR_INCOMING_MODULE_NAME_NOT_INSTALL);
        });
      }catch (e) {
        Utils.info("GetTargetOverlayModuleInfosModuleNameNotInstall callback catch" + JSON.stringify(e));
        expect(e.code).assertEqual(ERROR_INCOMING_MODULE_NAME_NOT_INSTALL);
      }

    })

  })
}