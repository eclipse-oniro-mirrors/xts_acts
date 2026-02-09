/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import hilog from '@ohos.hilog';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from '@ohos/hypium'
import common from '@ohos.app.ability.common';
import { BusinessError } from '@kit.BasicServicesKit';
import kioskManager from '@ohos.app.ability.kioskManager';

export default function KioskModeTest() {
  describe('KioskModeTest', () => {
    let context: common.UIAbilityContext | undefined = AppStorage.get<common.UIAbilityContext>('testAbilityContext');
  
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_KIOSK_0100
     * @tc.number SUB_Ability_AbilityRuntime_KIOSK_0100
     * @tc.desc   Test enterKioskMode(null) when application is not in kiosk app list or capability not supported.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_KIOSK_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName: string = 'SUB_Ability_AbilityRuntime_KIOSK_0100';
      hilog.info(0x0000, 'testTag', '%{public}s', `${caseName} begin`);
      try {
        kioskManager.enterKioskMode(null)
          .then(() => {
            hilog.info(0x0000, 'testTag', '%{public}s', `enterKioskMode(null) success`);
            expect().assertFail();
            done();
          })
          .catch((error: BusinessError) => {
            let msg: string = `enterKioskMode(null) error:${JSON.stringify(error)}`;
            hilog.info(0x0000, 'testTag', '%{public}s', msg);
            expect(error.code).assertEqual(801);
            done();
          });
      } catch (error) {
        let msg: string = `enterKioskMode(null) failed:${JSON.stringify(error)}`;
        hilog.info(0x0000, 'testTag', '%{public}s', msg);
        expect(error.code).assertEqual(401);
        done();
      }
    })
  
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_KIOSK_0200
     * @tc.number SUB_Ability_AbilityRuntime_KIOSK_0200
     * @tc.desc   Test enterKioskMode(undefined) when application is not in kiosk app list or capability not supported.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_KIOSK_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName: string = 'SUB_Ability_AbilityRuntime_KIOSK_0200';
      hilog.info(0x0000, 'testTag', '%{public}s', `${caseName} begin`);
      try {
        kioskManager.enterKioskMode(undefined)
          .then(() => {
            hilog.info(0x0000, 'testTag', '%{public}s', `enterKioskMode(undefined) success`);
            expect().assertFail();
            done();
          })
          .catch((error: BusinessError) => {
            let msg: string = `enterKioskMode(undefined) error:${JSON.stringify(error)}`;
            hilog.info(0x0000, 'testTag', '%{public}s', msg);
            expect(error.code).assertEqual(801);
            done();
          });
      } catch (error) {
        let msg: string = `enterKioskMode(undefined) failed:${JSON.stringify(error)}`;
        hilog.info(0x0000, 'testTag', '%{public}s', msg);
        expect(error.code).assertEqual(401);
        done();
      }
    })
  
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_KIOSK_0300
     * @tc.number SUB_Ability_AbilityRuntime_KIOSK_0300
     * @tc.desc   Test enterKioskMode(UIAbilityContext) when application is not in kiosk app list.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_KIOSK_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName: string = 'SUB_Ability_AbilityRuntime_KIOSK_0300';
      hilog.info(0x0000, 'testTag', '%{public}s', `${caseName} begin`);
      try {
        kioskManager.enterKioskMode(context)
          .then(() => {
            hilog.info(0x0000, 'testTag', '%{public}s', `enterKioskMode(UIAbilityContext) success`);
          })
          .catch((error: BusinessError) => {
            let msg: string = `enterKioskMode(UIAbilityContext) error:${JSON.stringify(error)}`;
            hilog.info(0x0000, 'testTag', '%{public}s', msg);
            let result: boolean = error.code == 801 || error.code == 16000110;
            expect(result).assertTrue();
            done();
          });
      } catch (error) {
        let msg: string = `enterKioskMode(UIAbilityContext) failed:${JSON.stringify(error)}`;
        hilog.info(0x0000, 'testTag', '%{public}s', msg);
        expect().assertFail();
        done();
      }
    })
  
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_KIOSK_0400
     * @tc.number SUB_Ability_AbilityRuntime_KIOSK_0400
     * @tc.desc   Test enterKioskMode(UIAbilityContext) when current ability is not in foreground.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_KIOSK_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName: string = 'SUB_Ability_AbilityRuntime_KIOSK_0400';
      hilog.info(0x0000, 'testTag', '%{public}s', `${caseName} begin`);
      context?.moveAbilityToBackground()
        .then(() => {
          hilog.info(0x0000, 'testTag', '%{public}s', `moveAbilityToBackground success`);
        })
        .catch((error: BusinessError) => {
          hilog.info(0x0000, 'testTag', '%{public}s', `moveAbilityToBackground error:${JSON.stringify(error)}`);
          if( error.code == 16000061 ) {
            done();
          }
        });

      setTimeout(() => {
        try {
          kioskManager.enterKioskMode(context)
            .then(() => {
              hilog.info(0x0000, 'testTag', '%{public}s', `enterKioskMode(UIAbilityContext) success`);
              expect().assertFail();
              done();
            })
            .catch((error: BusinessError) => {
              let msg: string = `enterKioskMode(UIAbilityContext) error:${JSON.stringify(error)}`;
              hilog.info(0x0000, 'testTag', '%{public}s', msg);
              let result: boolean = error.code == 801 || error.code == 16000113;
              expect(result).assertTrue();
              done();
            });
        } catch (error) {
          let msg: string = `enterKioskMode(UIAbilityContext) failed:${JSON.stringify(error)}`;
          hilog.info(0x0000, 'testTag', '%{public}s', msg);
          expect().assertFail();
          done();
        }
      }, 2000);
    })
  
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_KIOSK_0800
     * @tc.number SUB_Ability_AbilityRuntime_KIOSK_0800
     * @tc.desc   Test exitKioskMode(null) when application is not in kiosk app list or capability not supported.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_KIOSK_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName: string = 'SUB_Ability_AbilityRuntime_KIOSK_0800';
      hilog.info(0x0000, 'testTag', '%{public}s', `${caseName} begin`);
      try {
        kioskManager.exitKioskMode(null)
          .then(() => {
            hilog.info(0x0000, 'testTag', '%{public}s', `exitKioskMode(null) success`);
            expect().assertFail();
            done();
          })
          .catch((error: BusinessError) => {
            let msg: string = `exitKioskMode(null) error:${JSON.stringify(error)}`;
            hilog.info(0x0000, 'testTag', '%{public}s', msg);
            expect(error.code).assertEqual(801);
            done();
          });
      } catch (error) {
        let msg: string = `exitKioskMode(null) failed:${JSON.stringify(error)}`;
        hilog.info(0x0000, 'testTag', '%{public}s', msg);
        expect(error.code).assertEqual(401);
        done();
      }
    })
  
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_KIOSK_0900
     * @tc.number SUB_Ability_AbilityRuntime_KIOSK_0900
     * @tc.desc   Test exitKioskMode(undefined) when application is not in kiosk app list or capability not supported.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_KIOSK_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName: string = 'SUB_Ability_AbilityRuntime_KIOSK_0900';
      hilog.info(0x0000, 'testTag', '%{public}s', `${caseName} begin`);
      try {
        kioskManager.exitKioskMode(undefined)
          .then(() => {
            hilog.info(0x0000, 'testTag', '%{public}s', `exitKioskMode(undefined) success`);
            expect().assertFail();
            done();
          })
          .catch((error: BusinessError) => {
            let msg: string = `exitKioskMode(undefined) error:${JSON.stringify(error)}`;
            hilog.info(0x0000, 'testTag', '%{public}s', msg);
            expect(error.code).assertEqual(801);
            done();
          });
      } catch (error) {
        let msg: string = `exitKioskMode(undefined) failed:${JSON.stringify(error)}`;
        hilog.info(0x0000, 'testTag', '%{public}s', msg);
        expect(error.code).assertEqual(401);
        done();
      }
    })
  
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_KIOSK_1000
     * @tc.number SUB_Ability_AbilityRuntime_KIOSK_1000
     * @tc.desc   Test exitKioskMode(UIAbilityContext) when application is not in kiosk app list.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_KIOSK_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName: string = 'SUB_Ability_AbilityRuntime_KIOSK_1000';
      hilog.info(0x0000, 'testTag', '%{public}s', `${caseName} begin`);
      try {
        kioskManager.exitKioskMode(context)
          .then(() => {
            hilog.info(0x0000, 'testTag', '%{public}s', `exitKioskMode(UIAbilityContext) success`);
            expect().assertFail();
            done();
          })
          .catch((error: BusinessError) => {
            let msg: string = `exitKioskMode(UIAbilityContext) error:${JSON.stringify(error)}`;
            hilog.info(0x0000, 'testTag', '%{public}s', msg);
            let result: boolean = error.code == 801 || error.code == 16000110;
            expect(result).assertTrue();
            done();
          });
      } catch (error) {
        let msg: string = `exitKioskMode(UIAbilityContext) failed:${JSON.stringify(error)}`;
        hilog.info(0x0000, 'testTag', '%{public}s', msg);
        expect().assertFail();
        done();
      }
    })
  
    /**
     * @tc.name   SUB_Ability_AbilityRuntime_KIOSK_1100
     * @tc.number SUB_Ability_AbilityRuntime_KIOSK_1100
     * @tc.desc   Test kioskManager.KioskStatus.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_Ability_AbilityRuntime_KIOSK_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let caseName: string = 'SUB_Ability_AbilityRuntime_KIOSK_1100';
      hilog.info(0x0000, 'testTag', '%{public}s', `${caseName} begin`);

      let kioskStatus: kioskManager.KioskStatus = {
        isKioskMode: true,
        kioskBundleName: 'com.example.kioskdemo',
        kioskBundleUid: 123
      }

      expect(kioskStatus.isKioskMode).assertTrue();
      expect(kioskStatus.kioskBundleName).assertEqual('com.example.kioskdemo');
      expect(kioskStatus.kioskBundleUid).assertEqual(123);
      done();
    })
  })
}