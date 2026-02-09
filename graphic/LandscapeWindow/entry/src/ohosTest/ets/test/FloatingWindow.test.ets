/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect , Level, TestType, Size} from '@ohos/hypium';
import window from '@ohos.window';
import {GlobalContext} from './GlobalContext.test'
import { BusinessError } from '@ohos.base';
import { Driver, ON } from '@ohos.UiTest';

export default function FloatingWindowTest() {
  describe('FloatingWindowTest', () => {
    let tag = 'FloatingWindowTestLog:'
    beforeAll(async () => {
      console.info('beforeAll function.');
      try {
          let driver = Driver.create();
          let allowed = await driver.findComponent(ON.id('advanced_dialog_button_0'));
          console.log('findComponent allowed: ' + JSON.stringify(allowed));
          if(allowed){
            await allowed.click();
          }
        } catch (err) {
          console.error('findComponent allowed failed: ' + JSON.stringify(err));
        }
    })
    beforeEach(() => {
      console.info('beforeEach function.');
    })
    afterEach(() => {
      console.info('afterEach function.');
    })
    afterAll(() => {
      console.info('afterAll function.');
    })
    /**
     * @tc.name   test_landscap_disableLandscapeMultiWindow
     * @tc.number SUB_BASIC_WMS_FUNCTION_WULTMINDOW_LATERAL_FLOATING_1300
     * @tc.desc   preferMultWindowOrientation配置为landscap，调用disableLandscapeMultiWindow不报错
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('test_landscap_disableLandscapeMultiWindow', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done:Function) => {
      try{
        await window.getLastWindow(GlobalContext.getContext().getObject("context")).then(async (data) => {
          let windowClass = data;
          console.info(tag+'Succeeded in obtaining the top window. Data: ' + JSON.stringify(data));
          await windowClass.disableLandscapeMultiWindow().then(() => {
            console.info(tag+'Succeeded in making multi-window become not landscape.');
            done();
          }).catch((err:BusinessError) => {
            console.error(tag+'Failed to make multi-window become not landscape. Cause: ' + JSON.stringify(err));
            expect(false).assertTrue();
            done();
          });
        }).catch((err:BusinessError) => {
          console.error(tag+'Failed to obtain the top window. Cause: ' + JSON.stringify(err));
          expect(false).assertTrue();
          done();
        });
      } catch (err) {
        console.error(tag+'Failed to getLastWindow window. Cause: ' + JSON.stringify(err));
        expect(false).assertTrue();
        done();
      }

    })
  })
}