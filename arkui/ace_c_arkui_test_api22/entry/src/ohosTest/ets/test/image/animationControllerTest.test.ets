/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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

import { expect, describe, it, afterEach, beforeEach, Level, beforeAll } from '@ohos/hypium';
import { Driver, ON, PointerMatrix, Rect } from '@ohos.UiTest';
import router from '@ohos.router';
import Utils from '../common/Utils';

const SLEEP_TIME = 1000;

export default function AnimationControllerTest(){
  describe('AnimationControllerTest',  () =>{
    let PAGE_TAG = 'animationControllerTest';
    beforeAll(async (done: Function) => {
      await Utils.pushPage(`image/${PAGE_TAG}`, done);
    });

    /**
     * @tc.name    animationControllerTest001
     * @tc.number  animationControllerTest001
     * @tc.desc    Test the OH_ArkUI_DrawableDescriptor_CreateAnimationController interface
     *   to set ARKUI_ERROR_CODE_NO_ERROR
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it('animationControllerTest001',  Level.LEVEL2, async (done: Function) => {
      console.info('animationControllerTest001 START');
      let driver = await Driver.create();
      await Utils.sleep(SLEEP_TIME);
      let button = await driver.findComponent(ON.id('Button1'));
      await button.click();
      console.info('button1 click success');
      await Utils.sleep(SLEEP_TIME);
      let strJson = getInspectorByKey('text001');
      let obj: ESObject = JSON.parse(strJson);
      let strJson1 = getInspectorByKey('text002');
      let obj1: ESObject = JSON.parse(strJson1);
      let strJson2 = getInspectorByKey('text003');
      let obj2: ESObject = JSON.parse(strJson2);
      console.info('[animationControllerTest001 obj]:' + JSON.stringify(obj.$attrs.content));
      console.info('[animationControllerTest001 obj1]:' + JSON.stringify(obj1.$attrs.content));
      console.info('[animationControllerTest001 obj2]:' + JSON.stringify(obj2.$attrs.content));
      expect(obj.$attrs.content).assertEqual('err.Node1 = 0');
      expect(obj1.$attrs.content).assertEqual('err.Node2 = 0');
      expect(obj2.$attrs.content).assertEqual('err.Node3 = 0');
      console.log('animationControllerTest001 End')
      done()
    })
    /**
     * @tc.name    animationControllerTest002
     * @tc.number  animationControllerTest002
     * @tc.desc    Test the OH_ArkUI_DrawableDescriptor_StopAnimation interface
     *   to set ARKUI_ERROR_CODE_NO_ERROR
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it('animationControllerTest002',  Level.LEVEL2, async (done: Function) => {
      console.info('animationControllerTest002 START');
      let driver = await Driver.create();
      await Utils.sleep(SLEEP_TIME);
      let button2 = await driver.findComponent(ON.id('Button2'));
      await button2.click();
      console.info('button2 click success');
      await Utils.sleep(SLEEP_TIME);
      let strJson4 = getInspectorByKey('text004');
      console.info('[animationControllerTest002 obj]:' + strJson4);
      let obj4: ESObject = JSON.parse(strJson4);
      console.info('[animationControllerTest002 obj]:' + JSON.stringify(obj4.$attrs.content));
      expect(obj4.$attrs.content).assertEqual('err.Node4 = 0');
      console.log('animationControllerTest002 End')
      done()
    })
    /**
     * @tc.name    animationControllerTest003
     * @tc.number  animationControllerTest003
     * @tc.desc    Test the OH_ArkUI_DrawableDescriptor_PauseAnimation interface
     *   to set ARKUI_ERROR_CODE_NO_ERROR
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it('animationControllerTest003',  Level.LEVEL2, async (done: Function) => {
      console.info('animationControllerTest003 START');
      let driver = await Driver.create();
      await Utils.sleep(SLEEP_TIME);
      let button3 = await driver.findComponent(ON.id('Button3'));
      await button3.click();
      console.info('button3 click success');
      await Utils.sleep(SLEEP_TIME);
      let strJson5 = getInspectorByKey('text005');
      let obj5: ESObject = JSON.parse(strJson5);
      console.info('[animationControllerTest003 obj5]:' + JSON.stringify(obj5.$attrs.content));
      expect(obj5.$attrs.content).assertEqual('err.Node5 = 0');
      console.log('animationControllerTest003 End')
      done()
    })
    /**
     * @tc.name    animationControllerTest004
     * @tc.number  animationControllerTest004
     * @tc.desc    Test the OH_ArkUI_DrawableDescriptor_ResumeAnimation interface
     *   to set ARKUI_ERROR_CODE_NO_ERROR
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 2
     */
    it('animationControllerTest004',  Level.LEVEL2, async (done: Function) => {
      console.info('animationControllerTest004 START');
      let driver = await Driver.create();
      await Utils.sleep(SLEEP_TIME);
      let button4 = await driver.findComponent(ON.id('Button4'));
      await button4.click();
      console.info('button4 click success');
      await Utils.sleep(SLEEP_TIME);
      let strJson6 = getInspectorByKey('text006');
      let obj6: ESObject = JSON.parse(strJson6);
      console.info('[animationControllerTest004 obj6]:' + JSON.stringify(obj6.$attrs.content));
      expect(obj6.$attrs.content).assertEqual('err.Node6 = 0');
      console.log('animationControllerTest004 End')
      done()
    })
  })
}