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
let MODULE_NAME1 = "test1";
let moduleName2 = "entry";
let isEnabled = true;

export default function getTargetOverlayModuleInfos() {
  describe('getTargetOverlayModuleInfos',  () =>{

    /*
     * @tc.number: Sub_Bms_Framework_Overlay_Query_static_0600
     * @tc.name: Sub_Bms_Framework_Overlay_Query_static_0600
     * @tc.desc: The query fails when the incoming moduleName is empty
     */
    it("Sub_Bms_Framework_Overlay_Query_static_0600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {

        overlay.getTargetOverlayModuleInfos("",
          (err: BusinessError<void> | null, result: Array<OverlayModuleInfo> | undefined) => {
            if (err && err.code != 0) {
              hilog.error(0x0000, 'testParamTag', 'o7 getTargetOverlayModuleInfos callback failed: %{public}s', JSON.stringify(err));
              expect(err?.code).assertEqual(401);
              done();
            } else {
              hilog.info(0x0000, 'testParamTag', 'o7 getTargetOverlayModuleInfos success, Array<OverlayModuleInfo> length: ' + result!.length);
              expect().assertFail();
              done();
            }
          });
        await Utils.msSleep(1000);
        let op4 = overlay.getTargetOverlayModuleInfos("");
        op4.then((result: Array<OverlayModuleInfo>): Array<OverlayModuleInfo> => {
          hilog.info(0x0000, 'testParamTag', 'o8 getTargetOverlayModuleInfos Promise success, Array<OverlayModuleInfo> length: ' + result.length);
          expect().assertFail();
          done();
        }, (err: BusinessError<void>): void => {
          hilog.error(0x0000, 'testParamTag', 'o8 getTargetOverlayModuleInfos Promise then failed: %{public}s', JSON.stringify(err));
          expect(err.code).assertEqual(401);
          done();
        });
      })

    /*
     * @tc.number: Sub_Bms_Framework_Overlay_Query_static_0800
     * @tc.name: Sub_Bms_Framework_Overlay_Query_static_0800
     * @tc.desc: The query fails when the incoming moduleName is not installed
     */
    it("Sub_Bms_Framework_Overlay_Query_static_0800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        overlay.getTargetOverlayModuleInfos(MODULE_NAME1,
          (err: BusinessError<void> | null, result: Array<OverlayModuleInfo> | undefined) => {
            if (err && err.code != 0) {
              hilog.error(0x0000, 'testParamTag', 'o7 getTargetOverlayModuleInfos callback failed: %{public}s', JSON.stringify(err));
              expect(err?.code).assertEqual(17700002);
              done();
            } else {
              hilog.info(0x0000, 'testParamTag', 'o7 getTargetOverlayModuleInfos success, Array<OverlayModuleInfo> length: ' + result!.length);
              expect().assertFail();
              done();
            }
          });
        await Utils.msSleep(1000);
        let op4 = overlay.getTargetOverlayModuleInfos(MODULE_NAME1);
        op4.then((result: Array<OverlayModuleInfo>): Array<OverlayModuleInfo> => {
          hilog.info(0x0000, 'testParamTag', 'o8 getTargetOverlayModuleInfos Promise success, Array<OverlayModuleInfo> length: ' + result.length);
          expect().assertFail();
          done();
        }, (err: BusinessError<void>): void => {
          hilog.error(0x0000, 'testParamTag', 'o8 getTargetOverlayModuleInfos Promise then failed: %{public}s', JSON.stringify(err));
          expect(err.code).assertEqual(17700002);
          done();
        });

      })
  })
}