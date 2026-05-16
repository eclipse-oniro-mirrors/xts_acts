/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import floatView from '@ohos.window.floatView';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import { BusinessError } from '@ohos.base';
import { common } from '@kit.AbilityKit';
import window from '@ohos.window';
import deviceInfo from '@ohos.deviceInfo';

export default function abilityTest() {
  describe('ActsWindowFloatViewNoPermissionTest', () => {
    let sleep = (sleepMs: number) => new Promise<string>(resolve => setTimeout(resolve, sleepMs));
    let isDeviceSupportFloatView: boolean = false;
    let context: common.UIAbilityContext;
    let windowStage: window.WindowStage;

    beforeAll(async () => {
      let supportDeviceTypes: string[] = ['phone', '2in1', 'tablet'];
      isDeviceSupportFloatView = supportDeviceTypes.includes(deviceInfo.deviceType);
      console.info('beforeAll deviceType: ' + deviceInfo.deviceType + ', isDeviceSupportFloatView: ' + isDeviceSupportFloatView);
      windowStage = AppStorage.get('windowStage') as window.WindowStage;
      context = AppStorage.get('context') as common.UIAbilityContext;
      console.info('beforeAll context is: ' + context);
    })

    beforeEach(() => {
    })

    afterEach(async () => {
      await sleep(800)
    })

    afterAll(() => {
    })

    /**
     * @tc.name   test_start_no_permission_201
     * @tc.number SUB_BASIC_WMS_FLOAT_VIEW_NO_PERMISSION_0100
     * @tc.desc   test start floatView without permission, expect error code 201
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('test_start_no_permission_201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: Function) => {
      let CaseName: string = 'test_start_no_permission_201';
      console.log(CaseName + ' begin.');
      let config: floatView.FloatViewConfiguration = {
        context: context,
        templateType: floatView.FloatViewTemplateType.ROUNDED_RECTANGLE
      };
      try {
        let floatViewController = await floatView.create(config);
        console.info(CaseName + ' Succeeded in creating float view controller.');
        await floatViewController.setUIContext("testability/pages/First/index");
        console.info(CaseName + ' Succeeded in setting UI context.');
        floatViewController.start().then(async () => {
          console.info(CaseName + ' Succeeded in starting float view.');
          await floatViewController.stop();
          expect(false).assertTrue();
          done();
        }).catch(async (err: BusinessError) => {
          console.error(CaseName + ' Failed to start float view. Cause: ' + err.code + ', message: ' + err.message);
          expect(err.code).assertEqual(201);
          expect(err.message != null).assertTrue();
          done();
        });
      } catch (e) {
        console.error(CaseName + ' Failed. Cause: ' + e.code + ', message: ' + e.message);
        expect(e.message != null).assertTrue();
        if (e.code === 801 && !isDeviceSupportFloatView) {
          done();
        } else if (e.code === 201) {
          expect(e.code).assertEqual(201);
          expect(e.message != null).assertTrue();
          done();
        } else {
          expect(false).assertTrue();
          done();
        }
      }
    })
    
  })
}