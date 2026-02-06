import { describe, it, expect, TestType, Size, Level, beforeAll} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import common from '@ohos.app.ability.common';
import UIAbility from '@ohos.app.ability.UIAbility';
import { BusinessError } from '@ohos.base';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import Want from '@ohos.app.ability.Want';
import Utils from './Util.test';
import { OverlayModuleInfo } from 'bundleManager.OverlayModuleInfo';
import overlay from '@ohos.bundle.overlay';

let bundleName = "com.example.overLayTest";
let moduleName = "library";
let MODULE_NAME1 = "aaa";
let moduleName2 = "entry";
let isEnabled = true;

export default function getOverlayModuleInfo() {
  describe('getOverlayModuleInfo',  () =>{

    /*
     * @tc.number: Sub_Bms_Framework_Overlay_Query_static_0100
     * @tc.name: Sub_Bms_Framework_Overlay_Query_static_0100
     * @tc.desc: The query fails when the incoming moduleName is empty
     */
    it("Sub_Bms_Framework_Overlay_Query_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        let op3 = overlay.getOverlayModuleInfo("");
        op3.then((result: OverlayModuleInfo): OverlayModuleInfo => {
          hilog.info(0x0000, 'testParamTag', 'o6 getOverlayModuleInfo Promise success');
          expect().assertFail();
          done();
        }, (err: BusinessError<void>): void => {
          hilog.error(0x0000, 'testParamTag', 'o6 getOverlayModuleInfo Promise then failed: %{public}s', JSON.stringify(err));
          expect(err.code).assertEqual(401);
          done();
        });
        await Utils.msSleep(1000);
        overlay.getOverlayModuleInfo("", (err: BusinessError<void> | null, result: OverlayModuleInfo | undefined) => {
          if (err && err.code != 0) {
            hilog.error(0x0000, 'testParamTag', 'o5 getOverlayModuleInfo callback failed: %{public}s', JSON.stringify(err));
            expect(err?.code).assertEqual(401);
            done();
          } else {
            hilog.info(0x0000, 'testParamTag', 'o5 getOverlayModuleInfo success');
            expect().assertFail();
            done();
          }
        });
      })

    /*
     * @tc.number: Sub_Bms_Framework_Overlay_Query_static_0410
     * @tc.name: Sub_Bms_Framework_Overlay_Query_static_0410
     * @tc.desc: The query fails when the incoming moduleName is not existed
     */
    it("Sub_Bms_Framework_Overlay_Query_static_0410", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        overlay.getOverlayModuleInfo(MODULE_NAME1, (err: BusinessError<void> | null, result: OverlayModuleInfo | undefined) => {
          if (err && err.code != 0) {
            hilog.error(0x0000, 'testParamTag', 'o5 getOverlayModuleInfo callback failed: %{public}s', JSON.stringify(err));
            expect(err?.code).assertEqual(17700032);
            done();
          } else {
            hilog.info(0x0000, 'testParamTag', 'o5 getOverlayModuleInfo success');
            expect().assertFail();
            done();
          }
        });
        await Utils.msSleep(1000);
        let op3 = overlay.getOverlayModuleInfo(MODULE_NAME1);
        op3.then((result: OverlayModuleInfo): OverlayModuleInfo => {
          hilog.info(0x0000, 'testParamTag', 'o6 getOverlayModuleInfo Promise success');
          expect().assertFail();
          done();
        }, (err: BusinessError<void>): void => {
          hilog.error(0x0000, 'testParamTag', 'o6 getOverlayModuleInfo Promise then failed: %{public}s', JSON.stringify(err));
          expect(err.code).assertEqual(17700032);
          done();
        });
      })

    /*
     * @tc.number: SUB_BMS_APPINFO_OVERLAY_static_000X
     * @tc.name: SUB_BMS_APPINFO_OVERLAY_static_000X
     * @tc.desc: Query succeeded when the moduleName passed in is overlay
     */
    it("SUB_BMS_APPINFO_OVERLAY_static_000X", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
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
        done();
      })

  })
}