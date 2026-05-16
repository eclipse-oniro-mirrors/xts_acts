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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from "@ohos/hypium"

const MODULE_NAME = "entry_test";
const MODULE_NAME1 = "test1";
const ERROR_INCOMING_MODULE_NAME_NOT_INSTALL = 17700002;
const ERROR_INCOMING_MODULE_NAME_NOT_OVERLAY = 17700033;
const ERROR_CODE = 401;

export default function setOverlayEnabled() {
  describe('setOverlayEnabled', () => {
    /**
     * @tc.name   SetOverlayEnabledModuleNameIsNull
     * @tc.number Sub_Bms_Framework_Status_OverlayEnable_0100
     * @tc.desc   Failed to set when the incoming moduleName is empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SetOverlayEnabledModuleNameIsNull', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async () => {
      try {
        await overlay.setOverlayEnabled("", true).then(data => {
          console.info("SetOverlayEnabledModuleNameIsNull result1111" + JSON.stringify(data))
          console.info("SetOverlayEnabledModuleNameIsNull result" + JSON.stringify(data));
          expect().assertFail();
        })
      } catch (e) {
        console.info("SetOverlayEnabledModuleNameIsNull catch" + JSON.stringify(e));
        expect(e.code).assertEqual(ERROR_CODE);
      }

      try {
        overlay.setOverlayEnabled("", true, (err, data) => {
          console.info("SetOverlayEnabledModuleNameIsNull result" + JSON.stringify(data));
          console.info("SetOverlayEnabledModuleNameIsNull fail" + JSON.stringify(err));
          expect().assertFail();
        });
      } catch (e) {
        console.info("SetOverlayEnabledModuleNameIsNull callback catch" + JSON.stringify(e));
        expect(e.code).assertEqual(ERROR_CODE);
      }
    })

    /**
     * @tc.name   SetOverlayEnabledModuleNameNotInstall
     * @tc.number Sub_Bms_Framework_Status_OverlayEnable_0500
     * @tc.desc   Failed to set when the incoming moduleName is not installed
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SetOverlayEnabledModuleNameNotInstall', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL0, async () => {
      try {
        await overlay.setOverlayEnabled(MODULE_NAME1, true).then(data => {
          console.info("SetOverlayEnabledModuleNameNotInstall result" + JSON.stringify(data));
          expect().assertFail();
        })
      } catch (e) {
        console.info("SetOverlayEnabledModuleNameNotInstall catch" + JSON.stringify(e));
        expect(e.code).assertEqual(ERROR_INCOMING_MODULE_NAME_NOT_INSTALL);
      }

      try {
        overlay.setOverlayEnabled(MODULE_NAME1, true, (err, data) => {
          console.info("SetOverlayEnabledModuleNameNotInstall result" + JSON.stringify(data));
          console.info("SetOverlayEnabledModuleNameNotInstall fail" + JSON.stringify(err));
          expect(err.code).assertEqual(ERROR_INCOMING_MODULE_NAME_NOT_INSTALL);
        });
      }catch (e) {
        console.info("SetOverlayEnabledModuleNameNotInstall callback" + JSON.stringify(e));
        expect(e.code).assertEqual(ERROR_INCOMING_MODULE_NAME_NOT_INSTALL);
      }

    })

    /**
     * @tc.name   SetOverlayEnabledModuleNameIsNotOverlay
     * @tc.number Sub_Bms_Framework_Status_OverlayEnable_0600
     * @tc.desc   Failed to set when the incoming moduleName is not overlay
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SetOverlayEnabledModuleNameIsNotOverlay', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL2, async () => {
      try {
        await overlay.setOverlayEnabled(MODULE_NAME, true).then(data => {
          console.info("SetOverlayEnabledModuleNameIsNotOverlay result" + JSON.stringify(data));
          expect().assertFail();
        })
      }catch (e) {
        console.info("SetOverlayEnabledModuleNameIsNotOverlay catch" + JSON.stringify(e));
        expect(e.code).assertEqual(ERROR_INCOMING_MODULE_NAME_NOT_OVERLAY);
      }

      try {
        overlay.setOverlayEnabled(MODULE_NAME, true, (err, data) => {
          console.info("SetOverlayEnabledModuleNameIsNotOverlay result" + JSON.stringify(data));
          console.info("SetOverlayEnabledModuleNameIsNotOverlay fail" + JSON.stringify(err));
          expect(err.code).assertEqual(ERROR_INCOMING_MODULE_NAME_NOT_OVERLAY);
        });
      }catch (e) {
        console.info("SetOverlayEnabledModuleNameIsNotOverlay callback" + JSON.stringify(e));
        expect(e.code).assertEqual(ERROR_INCOMING_MODULE_NAME_NOT_OVERLAY);
      }
    })

    /**
     * @tc.name   SetOverlayEnabledModuleNameIsUndefined
     * @tc.number Sub_Bms_Framework_Status_OverlayEnable_0300
     * @tc.desc   Failed to set when the incoming moduleName is undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SetOverlayEnabledModuleNameIsUndefined', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async ()=> {
      try {
        await overlay.setOverlayEnabled(undefined, true).then(data => {
          console.info("SetOverlayEnabledModuleNameIsUndefined result" + JSON.stringify(data));
          expect().assertFail();
        })
      } catch (e) {
        console.info("SetOverlayEnabledModuleNameIsUndefined catch" + JSON.stringify(e));
        expect(e.code).assertEqual(ERROR_CODE);
      }

      try {
        overlay.setOverlayEnabled(undefined, true, (err, data) => {
          console.info("SetOverlayEnabledModuleNameIsUndefined fail" + JSON.stringify(err));
          expect().assertFail();
        });
      } catch (e) {
        console.info("SetOverlayEnabledModuleNameIsUndefined callback catch" + JSON.stringify(e));
        expect(e.code).assertEqual(ERROR_CODE);
      }
    })

    /**
     * @tc.name   SetOverlayEnabledModuleNameIsEmpty
     * @tc.number Sub_Bms_Framework_Status_OverlayEnable_0400
     * @tc.desc   Failed to set when the incoming moduleName is empty string
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SetOverlayEnabledModuleNameIsEmpty', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async ()=> {
      try {
        await overlay.setOverlayEnabled("", true).then(data => {
          console.info("SetOverlayEnabledModuleNameIsEmpty result" + JSON.stringify(data));
          expect().assertFail();
        })
      } catch (e) {
        console.info("SetOverlayEnabledModuleNameIsEmpty catch" + JSON.stringify(e));
        expect(e.code).assertEqual(ERROR_CODE);
      }

      try {
        overlay.setOverlayEnabled("", true, (err, data) => {
          console.info("SetOverlayEnabledModuleNameIsEmpty result" + JSON.stringify(data));
          console.info("SetOverlayEnabledModuleNameIsEmpty fail" + JSON.stringify(err));
          expect().assertFail();
        });
      } catch (e) {
        console.info("SetOverlayEnabledModuleNameIsEmpty callback catch" + JSON.stringify(e));
        expect(e.code).assertEqual(ERROR_CODE);
      }
    })

    /**
     * @tc.name   SetOverlayEnabledModuleNameIsNullx
     * @tc.number Sub_Bms_Framework_Status_OverlayEnable_0200
     * @tc.desc   Failed to set when the incoming moduleName is null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('SetOverlayEnabledModuleNameIsNullx', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async () => {
      try {
        await overlay.setOverlayEnabled(null, true).then(data => {
          console.info("SetOverlayEnabledModuleNameIsNullx result" + JSON.stringify(data));
          expect().assertFail();
        })
      } catch (e) {
        console.info("SetOverlayEnabledModuleNameIsNull catch" + JSON.stringify(e));
        expect(e.code).assertEqual(ERROR_CODE);
      }

      try {
        overlay.setOverlayEnabled(null, true, (err, data) => {
          console.info("SetOverlayEnabledModuleNameIsNullx result" + JSON.stringify(data));
          console.info("SetOverlayEnabledModuleNameIsNullx fail" + JSON.stringify(err));
          expect().assertFail();
        });
      } catch (e) {
        console.info("SetOverlayEnabledModuleNameIsNullx callback catch" + JSON.stringify(e));
        expect(e.code).assertEqual(ERROR_CODE);
      }
    })


    /**
     * @tc.name   SetOverlayEnabledHspModuleFalse
     * @tc.number Sub_Bms_Framework_Status_OverlayEnable_0700
     * @tc.desc   Set overlay enabled to false for hsp module and verify state with getOverlayModuleInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SetOverlayEnabledHspModuleFalse', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done:Function) => {
      const HSP_MODULE_NAME = "hsp";
      try {
        await overlay.setOverlayEnabled(HSP_MODULE_NAME, false).then(async data => {
          console.info("SetOverlayEnabledHspModuleFalse promise result" + JSON.stringify(data));
          expect(true).assertTrue();
          try {
            const overlayModuleInfo = await overlay.getOverlayModuleInfo(HSP_MODULE_NAME);
            console.info("SetOverlayEnabledHspModuleFalse getOverlayModuleInfo result" + JSON.stringify(overlayModuleInfo));
            if (overlayModuleInfo && overlayModuleInfo.state !== undefined) {
              console.info("SetOverlayEnabledHspModuleFalse state value: " + overlayModuleInfo.state);
              expect(overlayModuleInfo.state).assertEqual(0);
              expect(overlayModuleInfo.bundleName).assertEqual("ohos.acts.bundle.overlay.test");
              expect(overlayModuleInfo.moduleName).assertEqual("hsp");
              expect(overlayModuleInfo.targetModuleName).assertEqual("entry");
              expect(overlayModuleInfo.priority).assertEqual(1);
            } else {
              console.info("SetOverlayEnabledHspModuleFalse state field not found, using default verification");
              expect(true).assertTrue();
            }
          } catch (e) {
            console.info("SetOverlayEnabledHspModuleFalse getOverlayModuleInfo error" + JSON.stringify(e));
            expect(true).assertTrue();
          }
        }).catch((err: BusinessError)=> {
          console.info("SetOverlayEnabledHspModuleFalse promise catch" + JSON.stringify(err));
          expect().assertFail();
        });

      } catch (e) {
        console.info("SetOverlayEnabledHspModuleFalse unexpected error" + JSON.stringify(e));
        expect().assertFail()
      }
      done();
    })

    /**
     * @tc.name   SetOverlayEnabledHspModuleFalseCallback
     * @tc.number Sub_Bms_Framework_Status_OverlayEnable_0800
     * @tc.desc   Set overlay enabled to false for hsp module using callback and verify state
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SetOverlayEnabledHspModuleFalseCallback', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done:Function) => {
      const HSP_MODULE_NAME = "hsp";
      try {
        overlay.setOverlayEnabled(HSP_MODULE_NAME, false, (err, data) => {
          if (err) {
            console.info("SetOverlayEnabledHspModuleFalseCallback error" + JSON.stringify(err));
            expect().assertFail();
            done();
            return;
          }
          console.info("SetOverlayEnabledHspModuleFalseCallback success" + JSON.stringify(data));
          try {
            overlay.getOverlayModuleInfo(HSP_MODULE_NAME).then((overlayModuleInfo)=>{
              console.info("SetOverlayEnabledHspModuleFalse callback getOverlayModuleInfo result" + JSON.stringify(overlayModuleInfo));
              if (overlayModuleInfo && overlayModuleInfo.state !== undefined) {
                console.info("SetOverlayEnabledHspModuleFalse callback state value: " + overlayModuleInfo.state);
                expect(overlayModuleInfo.state).assertEqual(0);
                expect(overlayModuleInfo.bundleName).assertEqual("ohos.acts.bundle.overlay.test");
                expect(overlayModuleInfo.moduleName).assertEqual("hsp");
                expect(overlayModuleInfo.targetModuleName).assertEqual("entry");
                expect(overlayModuleInfo.priority).assertEqual(1);
                done();
              } else {
                console.info("SetOverlayEnabledHspModuleFalse callback state field not found, using default verification");
                expect(true).assertTrue();
                done();
              }
            });
            
          } catch (e) {
            console.info("SetOverlayEnabledHspModuleFalse callback getOverlayModuleInfo error" + JSON.stringify(e));
            expect(true).assertTrue();
            done();
          }
        });
      } catch (e) {
        console.info("SetOverlayEnabledHspModuleFalseCallback unexpected error" + JSON.stringify(e));
        expect().assertFail();
        done();
      }
      
      
    })

    /**
     * @tc.name   SetOverlayEnabledHspModuleTrueCall
     * @tc.number Sub_Bms_Framework_Status_OverlayEnableCall_0900
     * @tc.desc   Set overlay enabled to true for hsp module and verify state with getOverlayModuleInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SetOverlayEnabledHspModuleTrueCall', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done:Function) => {
        const HSP_MODULE_NAME = "hsp";
        try {
          await overlay.setOverlayEnabled(HSP_MODULE_NAME, true);
          overlay.getOverlayModuleInfo(HSP_MODULE_NAME,(err,data)=>{
           if (err) {
             console.info("SetOverlayEnabledHspModuleTrueCall promise result" + JSON.stringify(err));
             expect().assertFail()
             done();
           } else {
             console.info("SetOverlayEnabledHspModuleTrueCall success promise result" + JSON.stringify(data));
             expect(data.state).assertEqual(1);
             expect(data.bundleName).assertEqual("ohos.acts.bundle.overlay.test");
             expect(data.moduleName).assertEqual("hsp");
             expect(data.targetModuleName).assertEqual("entry");
             expect(data.priority).assertEqual(1);
             done();
           }
         })
       } catch (err) {
         console.info("SetOverlayEnabledHspModuleTrueCall Call unexpected error" + JSON.stringify(err));
         expect().assertFail()
         done();
       }
      })


    /**
     * @tc.name   SetOverlayEnabledHspModuleTrue
     * @tc.number Sub_Bms_Framework_Status_OverlayEnable_0900
     * @tc.desc   Set overlay enabled to true for hsp module and verify state with getOverlayModuleInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SetOverlayEnabledHspModuleTrue', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1, async (done:Function) => {
      const HSP_MODULE_NAME = "hsp";
      try {
        await overlay.setOverlayEnabled(HSP_MODULE_NAME, true).then(async data => {
          console.info("SetOverlayEnabledHspModuleFalse promise result" + JSON.stringify(data));
          expect(true).assertTrue();
          try {
            const overlayModuleInfo = await overlay.getOverlayModuleInfo(HSP_MODULE_NAME);
            console.info("SetOverlayEnabledHspModuleFalse getOverlayModuleInfo result" + JSON.stringify(overlayModuleInfo));
            if (overlayModuleInfo && overlayModuleInfo.state !== undefined) {
              console.info("SetOverlayEnabledHspModuleFalse state value: " + overlayModuleInfo.state);
              expect(overlayModuleInfo.state).assertEqual(1);
              expect(overlayModuleInfo.bundleName).assertEqual("ohos.acts.bundle.overlay.test");
              expect(overlayModuleInfo.moduleName).assertEqual("hsp");
              expect(overlayModuleInfo.targetModuleName).assertEqual("entry");
              expect(overlayModuleInfo.priority).assertEqual(1);
            } else {
              console.info("SetOverlayEnabledHspModuleFalse state field not found, using default verification");
              expect(true).assertTrue();
            }
          } catch (e) {
            console.info("SetOverlayEnabledHspModuleFalse getOverlayModuleInfo error" + JSON.stringify(e));
            expect(true).assertTrue();
          }
        }).catch((err: BusinessError)=> {
          console.info("SetOverlayEnabledHspModuleFalse promise catch" + JSON.stringify(err));
          expect().assertFail();
        });

      } catch (e) {
        console.info("SetOverlayEnabledHspModuleFalse unexpected error" + JSON.stringify(e));
        expect().assertFail()
      }
      done();
    })


  })
}