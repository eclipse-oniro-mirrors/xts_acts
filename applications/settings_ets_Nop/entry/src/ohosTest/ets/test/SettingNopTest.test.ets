/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect } from '@ohos/hypium';
import settings from '@ohos.settings';
import { BusinessError } from '@ohos.base';

const context: Context =  getContext(this);

export default function SettingNopTest() {
  describe('SettingNopTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })
    /*
     * @tc.number:SUB_Setting_nop_test_0100
     * @tc.name: Setting_nop_test_0100
     * @tc.desc:Using the on method without permission
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('Setting_nop_test_0100', 0, async (done : Function) => {
      try {
        let name = 'settings.screen.brightness10';
        let ret  = settings.setValueSync(globalThis.abilityContext, name, "test getValueSync",settings.domainName.DEVICE_SHARED);
        settings.setValue(context, settings.display.SCREEN_BRIGHTNESS_STATUS, '100', (status) => {
          console.log('Callback return whether value is set.');
        });
        if (ret == true) {
          console.info('success to sync');
          expect(ret == true).assertTrue();
          done()
        } else {
          console.info('nopermisson to sync');
          expect(ret == false).assertTrue();
          done()
        }
      } catch (e) {
        let error = e as BusinessError
        console.error('settings1 catch error: ' + JSON.stringify(error));
        console.log('settings1 catch error log: ' + error.code);
        expect(error.code == 201).assertTrue()
      }
      done();
    })
    /*
     * @tc.number:SUB_Setting_nop_test_0200
     * @tc.name: Setting_nop_test_0200
     * @tc.desc:Using the on method without permission
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('Setting_nop_test_0200', 0, async (done : Function) => {
      try {
        settings.setValue(context, settings.display.SCREEN_BRIGHTNESS_STATUS, '100', (status) => {
          console.log('Callback return whether value is set.');
          expect(status).assertEqual(true)
        });
      } catch (e) {
        let error = e as BusinessError
        console.error('settings2 catch error: ' + JSON.stringify(error));
        console.log('settings2 catch error log: ' + error.code);
        expect(error.code == 201).assertTrue()
      }
      done();
    })
    /*
     * @tc.number:SUB_Setting_nop_test_0300
     * @tc.name: Setting_nop_test_0300
     * @tc.desc:Using the on method without permission
     * @tc.level:Level 3
     * @tc.type:Function
     * @tc.size:MediumTest
     */
    it('Setting_nop_test_0300', 0, async (done : Function) => {
      try {
        settings.setValue(context, settings.display.SCREEN_BRIGHTNESS_STATUS, '100', settings.domainName.DEVICE_SHARED).then((status) => {
          console.log(`callback:return whether value is set.`)
          expect(status).assertEqual(true)
        });
      } catch (e) {
        let error = e as BusinessError
        console.error('settings3 catch error: ' + JSON.stringify(error));
        console.log('settings3 catch error log: ' + error.code);
        expect(error.code == 201).assertTrue()
      }
      done();
    })
  })
}