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

import { beforeAll, describe, expect, it, afterAll, Level } from '@ohos/hypium';
import Utils from '../common/Utils';
import nativeRender from 'libnativerender.so'
import {UiComponent, UiDriver, Component, Driver, UiWindow, ON, BY, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import commoneventmanager from '@ohos.commonEventManager';
import inputMethod from '@ohos.inputMethod';
import { BusinessError } from '@ohos.base'

export default function textAreaOnSubmitTest() {

  describe('TextAreaOnSubmitTest', () => {
    const delegator:AbilityDelegatorRegistry.AbilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
    let PAGE_TAG = 'TextAreaOnSubmitTest';

    beforeAll(async (done: Function) => {
      await Utils.pushPage(`textarea/${PAGE_TAG}`, done);
      console.info('====>beforeAll inputMethod_enable start!')
      try {
        await delegator.executeShellCommand('ime -e com.openharmony.arkui_capi_xts -f').then(result =>{
          console.info(`ime -e com.openharmony.arkui_capi_xts -f finished, result = ${JSON.stringify(result)}`);
            delegator.executeShellCommand('ime -s com.openharmony.arkui_capi_xts').then(result => {
              console.info(`ime -s com.openharmony.arkui_capi_xts finished, result = ${JSON.stringify(result)}`);
              done();
            }).catch((err: Error) => {
              console.info(`ime -s com.openharmony.arkui_capi_xts failed, err = ${JSON.stringify(err)}`);
              done();
            })
          }).catch((err: Error) => {
            console.info(`ime -e com.openharmony.arkui_capi_xts -f failed, err = ${JSON.stringify(err)}`);
            done();
        })  
        console.info('====>beforeAll inputMethod_enable success');
      } catch (err) {
        console.info('====>beforeAll throw err:' + JSON.stringify(err.message))
        done();
      }
    });

    afterAll(async (done: Function) =>{
      console.info('====>afterAll reset inputMethod!')
      try {
        await delegator.executeShellCommand('ime -s com.huawei.hmos.inputmethod').then(result =>{
          console.info(`ime -s com.huawei.hmos.inputmethod finished, result = ${JSON.stringify(result)}`);
          }).catch((err: Error) => {
            console.info(`ime -s com.huawei.hmos.inputmethod failed, err = ${JSON.stringify(err)}`);
            done();
        })  
        console.info('====>afterAll reset inputMethod success!');
        done();
      } catch (err) {
        console.info('====>afterAll throw err:' + JSON.stringify(err.message))
        done();
      }
    });

    /**
     * @tc.name   testTextAreaOnSubmit001
     * @tc.number SUB_ARKUI_CAPI_TEXTAREA_ONSUBMIT_0100
     * @tc.desc   test onSubmit event callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testTextAreaOnSubmit001', Level.LEVEL1, async (done: Function) => {
    await Utils.sleep(1000);
    let driver = await Driver.create()
    await Utils.sleep(1000);
    let TextArea = await driver.findComponent(ON.id('OnSubmitTestTextArea'));
    //前置回调定义
      let publishCallback = async (err: BusinessError) => {
        console.log('testTextAreaOnSubmit001  ---------- publishCallback START ')
        //点击触发
        await Utils.sleep(200);
        await TextArea.click()
        console.log('testTextAreaOnSubmit001  ---------- publishCallback END ')
      }
      //挂载输入法事件
      let commonEventPublishData: commoneventmanager.CommonEventPublishData = {
        code: 10
      }
      commoneventmanager.publish('InputMethodWindManageTest', commonEventPublishData, publishCallback);
      await Utils.sleep(1000)
      let dataArray: number[][] = nativeRender.getTextAreaSubmitData();
      console.log('testTextAreaOnSubmit001', JSON.stringify(dataArray))
      let textAreaSubmitData: number[] = dataArray[0];
      expect(textAreaSubmitData[0] == 2).assertEqual(true)
      done()
    })

  })
}
